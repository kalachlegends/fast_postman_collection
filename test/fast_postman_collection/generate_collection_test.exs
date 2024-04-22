defmodule FastCollection.GenerateCollectionTest do
  use ExUnit.Case

  setup do
    Application.put_env(:fast_collection, :router, TestAppWeb.Router)
  end

  test "FastCollection.Collect.generate_data_by_router()" do
    data = FastCollection.Collect.generate_data_by_router()

    %FastCollection.GenerateCollection.Structs.Main{
      info: %FastCollection.GenerateCollection.Structs.Info{
        schema: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
      }
    } = FastCollection.GenerateCollection.generate(data, %{})
  end

end
