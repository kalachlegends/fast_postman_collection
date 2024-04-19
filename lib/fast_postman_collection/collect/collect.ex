defmodule FastPostmanCollection.Collect do
  alias FastPostmanCollection.{CollectDataItem, CollectDataModule}

  def generate_data_by_router(router \\ nil) do
    router = Application.get_env(:fast_postman_collection, :router) || router

    if(is_nil(router)) do
      raise FastPostmanCollection.Expectation.PhoenixRouterNotFound
    end

    collect_documentation(apply(router, :__routes__, []), router)
  end

  def collect_documentation(list, router) when is_list(list) do
    list
    |> Enum.sort()
    |> Enum.uniq()
    |> Enum.map(&handle_generate_data(&1, router))
  end

  defp handle_generate_data(%{plug: plug, verb: verb, path: path} = item, router) do
    {_, _, _, _, doc, doc_params, functions} = Code.fetch_docs(plug)

    functions_list =
      functions
      |> Enum.filter(fn {{_, _, _}, _, _, type, _} -> type != :hidden end)
      |> Enum.map(fn {{_, function_name, _}, _, _, doc, doc_params} ->
        %CollectDataItem{
          name: function_name,
          method: verb,
          route: path,
          pipe_through:
            FastPostmanCollection.Helpers.RouterInfo.route_info(
              router,
              Atom.to_string(verb)
              |> String.upcase(),
              path,
              "h"
            )[:pipe_through],
          title: documentation_handler(doc) |> title(),
          documentation: documentation_handler(doc) |> documentation_body(),
          doc_params: FastPostmanCollection.CollectDataItemParams.get_from_map(doc_params)
        }
      end)

    %CollectDataModule{
      module: plug,
      doc_params: FastPostmanCollection.CollectDataModuleParams.get_from_map(doc_params),
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
