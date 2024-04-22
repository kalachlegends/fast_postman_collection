defmodule FastPostmanCollection.MixTest do
  alias FastPostmanCollection.CollectDataModuleParams
  use ExUnit.Case, async: true

  setup do
    Application.put_env(:fast_postman_collection, :router, TestAppWeb.Router)
  end

  test "FastPostmanCollection.Mix.Tasks.GetCollection.run()/0" do
    :ok = Mix.Tasks.Fs.GetCollection.run([])
  end
end
