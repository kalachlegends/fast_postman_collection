defmodule FastCollection.Helpers.RouterInfo do
  def route_info(router, method, path, host) when is_binary(path) do
    split_path = for segment <- String.split(path, "/"), segment != "", do: segment
    route_info(router, method, split_path, host)
  end

  def route_info(router, method, split_path, host) when is_list(split_path) do
    with {metadata, _prepare, _pipeline, {_plug, _opts}} <-
           router.__match_route__(split_path, method, host) do
      Map.delete(metadata, :conn)
    end
  end
end
