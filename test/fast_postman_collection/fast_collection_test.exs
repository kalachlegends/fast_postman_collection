defmodule FastCollectionTest do
  use ExUnit.Case
  doctest FastCollection

  setup do
    Application.put_env(:fast_collection, :router, TestAppWeb.Router)
  end

  test "FastPostmanCollection" do
    json = FastCollection.generate_json()

    assert json =~ "something_in_paramss"

    assert json =~ "something_in_body"
    assert json =~ "User index"
    assert json =~ "get_someting_in_body"
    assert json =~ "3245435123"
    assert json =~ "2000321312"
  end
end
