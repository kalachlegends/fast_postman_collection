defmodule FastPostmanCollection.Collect do
  alias FastPostmanCollection.{CollectDataItem, CollectDataModule}

  @spec collect_documentation(router :: module() | nil) :: list(%CollectDataItem{})
  def generate_data_by_router(router \\ nil) do
    router = Application.get_env(:fast_postman_collection, :router) || router

    if(is_nil(router)) do
      raise FastPostmanCollection.Expectation.PhoenixRouterNotFound
    end

    collect_documentation(apply(router, :__routes__, []))
  end

  @spec collect_documentation(maybe_improper_list()) :: list(%CollectDataItem{})
  def collect_documentation(list) when is_list(list) do
    list
    |> Enum.sort()
    |> Enum.uniq()
    |> Enum.map(&handle_generate_data(&1))
  end

  defp handle_generate_data(%{plug: plug}) do
    handle_generate_data(plug)
  end

  defp handle_generate_data(module) when is_atom(module) do
    {_, _, _, _, doc, doc_params, functions} = Code.fetch_docs(module)

    functions_list =
      functions
      |> Enum.filter(fn {{_, _, _}, _, _, type, _} -> type != :hidden end)
      |> Enum.map(fn {{_, function_name, _}, _, _, doc, doc_params} ->
        %CollectDataItem{
          name: function_name,
          title: documentation_handler(doc) |> title(),
          documentation: documentation_handler(doc) |> documentation_body(),
          doc_params: doc_params
        }
      end)

    %CollectDataModule{
      module: module,
      doc_params: doc_params,
      title: documentation_handler(doc) |> title(),
      documentation: documentation_handler(doc) |> documentation_body(),
      functions: functions_list
    }
  end

  defp title(nil), do: nil

  defp title(str) when is_bitstring(str) do
    case Regex.run(~r/^# (.+?)\n/, str) do
      [_, title] -> title
      _any -> nil
    end
  end

  defp title(_any), do: nil

  defp documentation_body(nil), do: nil

  defp documentation_body(doc) do
    case Regex.run(~r/^# (.+?)\n/, doc) do
      [_, title] -> String.replace(doc, "# #{title}", "")
      _any -> String.split(doc, "\n")
    end
  end

  defp documentation_handler(%{"en" => doc}), do: doc
  defp documentation_handler(:none), do: nil
  defp documentation_handler(_any), do: nil
end
