defmodule FastCollection.GenerateCollection.Structs.Auth do
  defstruct type: "bearer", bearer: []
  alias FastCollection.GenerateCollection.Structs.Variable
  alias FastCollection.CollectDataItem

  def generate(item = %CollectDataItem{}) do
    %__MODULE__{
      type: "bearer",
      bearer: get_config_auth_pipe(item)
    }
  end

  def get_config_auth_pipe(item = %CollectDataItem{}) do
    tokens = FastCollection.Config.get_pipe_tokens()

    item.pipe_through
    |> Enum.filter(fn x -> x in tokens end)
    |> Enum.map(fn x ->
      name_token = Atom.to_string(x) <> "_token"
      %{key: "token", value: "{{#{name_token}}}"}
    end)
  end

  def get_variables_tokens() do
    tokens = FastCollection.Config.get_pipe_tokens()

    Enum.map(tokens, fn x ->
      name_token = Atom.to_string(x) <> "_token"
      %Variable{key: name_token, value: "write_token"}
    end)
  end
end
