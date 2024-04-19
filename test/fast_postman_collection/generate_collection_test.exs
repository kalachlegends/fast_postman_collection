defmodule FastPostmanCollection.GenerateCollectionTest do
  use ExUnit.Case

  setup do
    Application.put_env(:fast_postman_collection, :router, TestAppWeb.Router)
  end

  test "FastPostmanCollection.Collect.generate_data_by_router()" do
    data = FastPostmanCollection.Collect.generate_data_by_router()

    %FastPostmanCollection.GenerateCollection.Structs.Main{
      info: %FastPostmanCollection.GenerateCollection.Structs.Info{
        schema: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
      }
    } = FastPostmanCollection.GenerateCollection.generate(data, %{})
  end
end
