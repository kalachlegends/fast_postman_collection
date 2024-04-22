defmodule FastCollection.GenerateCollection.Structs.Item do
  defstruct [
    :name,
    :variable,
    :event,
    request: %FastCollection.GenerateCollection.Structs.Request{}
  ]
end
