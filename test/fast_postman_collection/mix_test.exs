defmodule FastCollection.MixTest do
  alias FastCollection.CollectDataModuleParams
  use ExUnit.Case, async: true

  setup do
    Application.put_env(:fast_collection, :router, TestAppWeb.Router)
  end

  test "FastCollection.Mix.Tasks.GetCollection.run()/0" do
    :ok = FastCollection.Mix.Tasks.GetCollection.run([])
  end
end
