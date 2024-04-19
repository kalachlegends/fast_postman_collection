defmodule FastPostmanCollection.GenerateCollection do
  alias FastPostmanCollection.GenerateCollection.Structs.Auth
  alias FastPostmanCollection.GenerateCollection.Structs.Body
  alias FastPostmanCollection.GenerateCollection.Structs.Url
  alias FastPostmanCollection.GenerateCollection.Structs.Request
  alias FastPostmanCollection.GenerateCollection.Structs.Item
  alias FastPostmanCollection.CollectDataItem
  alias FastPostmanCollection.CollectDataModule
  alias FastPostmanCollection.GenerateCollection.Structs.Folder
  alias FastPostmanCollection.GenerateCollection.Structs.Main

  def generate(collected_data, attrs)
      when (is_list(collected_data) and is_map(attrs)) or is_list(attrs) do
    folders =
      FastPostmanCollection.Helpers.Map.prepare_folder(collected_data)
      |> FastPostmanCollection.Helpers.Map.to_keyword_list()
      |> recursive_build([])

    %Main{
      item: folders
    }
  end

  def generate_to_json(collected_data, attrs)
      when (is_list(collected_data) and is_map(attrs)) or is_list(attrs) do
    generate(collected_data, attrs) |> Jason.encode!()
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
