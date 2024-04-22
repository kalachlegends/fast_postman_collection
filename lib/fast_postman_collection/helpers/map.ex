defmodule FastPostmanCollection.Helpers.Map do
  def to_keyword_list(map) do
    Enum.map(map, fn {k, v} ->
      v =
        cond do
          is_struct(v) -> v
          is_map(v) -> to_keyword_list(v)
          true -> v
        end

      {"#{k}", v}
    end)
  end

  def map_from_struct_recursive(map) when is_struct(map) do
    map =
      map
      |> Map.from_struct()

    for {k, v} <- map, into: %{}, do: {k, map_from_struct_recursive(v)}
  end

  def map_from_struct_recursive(map) when is_list(map) do
    map
    |> Enum.map(fn x -> map_from_struct_recursive(x) end)
  end

  def map_from_struct_recursive(map) when is_map(map) do
    for {k, v} <- map, into: %{}, do: {k, map_from_struct_recursive(v)}
  end

  def map_from_struct_recursive(map) do
    map
  end

  def prepare_folder(collected_data) do
    Enum.reduce(
      collected_data,
      %{},
      fn x, acc ->
        keys = x.doc_params.folder_path

        name_key_to_put = "#{x.title || x.module}"

        cond do
          is_binary(keys) ->
            keys = keys |> String.split("/")
            keys = Enum.map(keys, &Access.key(&1, %{}))

            map = get_in(acc, keys)
            put_in(acc, keys, Map.put(map, name_key_to_put, x))

          true ->
            acc |> Map.put(name_key_to_put, x)
        end
      end
    )
  end
end
