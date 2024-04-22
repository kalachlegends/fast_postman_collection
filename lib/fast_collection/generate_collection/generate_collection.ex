defmodule FastCollection.GenerateCollection do
  alias FastCollection.GenerateCollection.Structs.Info
  alias FastCollection.Config
  alias FastCollection.GenerateCollection.Structs.Auth
  alias FastCollection.GenerateCollection.Structs.Body
  alias FastCollection.GenerateCollection.Structs.Url
  alias FastCollection.GenerateCollection.Structs.Request
  alias FastCollection.GenerateCollection.Structs.Item
  alias FastCollection.CollectDataItem
  alias FastCollection.CollectDataModule
  alias FastCollection.GenerateCollection.Structs.Folder
  alias FastCollection.GenerateCollection.Structs.Main

  def generate(collected_data, attrs)
      when (is_list(collected_data) and is_map(attrs)) or is_list(attrs) do
    folders =
      FastCollection.Helpers.Map.prepare_folder(collected_data)
      |> FastCollection.Helpers.Map.to_keyword_list()
      |> recursive_build([])

    %Main{
      item: folders,
      info: %Info{
        name: Config.get_name_collection()
      },
      variable: Auth.get_variables_tokens() ++ Config.get_variables()
    }
  end

  def generate_to_json(collected_data, attrs)
      when (is_list(collected_data) and is_map(attrs)) or is_list(attrs) do
    generate(collected_data, attrs)
    |> FastCollection.Helpers.Map.map_from_struct_recursive()
    |> Jason.encode!()
  end

  defp recursive_build([{key, value}], acc) when is_list(value) do
    [%Folder{name: key, item: recursive_build(value, [])} | acc]
  end

  defp recursive_build([{key, value} | t], acc) when is_list(value) do
    recursive_build(t, []) ++ [%Folder{name: key, item: recursive_build(value, [])} | acc]
  end

  defp recursive_build([{_key, value} | t], acc)
       when is_struct(value) do
    recursive_build(t, [parse_collect_data_module(value) | acc])
  end

  defp recursive_build([], acc) do
    acc
  end

  def parse_collect_data_module(item = %CollectDataModule{}) do
    %Folder{
      item: Enum.map(item.functions, &parse_collect_data_item/1),
      name: "#{item.title || item.module}"
    }
  end

  def parse_collect_data_item(item = %CollectDataItem{}) do
    %Item{
      name: "#{item.title || item.name}",
      request: %Request{
        method: item.method,
        body: Body.generate(item),
        url: Url.generate(item),
        auth: Auth.generate(item)
      }
    }
  end
end
