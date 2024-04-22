defmodule FastPostmanCollectionTest do
  use ExUnit.Case
  doctest FastPostmanCollection

  setup do
    Application.put_env(:fast_postman_collection, :router, TestAppWeb.Router)
  end

  test "FastPostmanCollection" do
    json = FastPostmanCollection.generate_json()

    assert json =~ "something_in_paramss"

    assert json =~ "something_in_body"
    assert json =~ "User index"
    assert json =~ "get_someting_in_body"
    assert json =~ "3245435123"
    assert json =~ "2000321312"
    assert json =~ "new_title_popular"
    assert json =~ "TestAppWeb.UserController"
    assert json =~ "some_uniq_function"
  end
end
