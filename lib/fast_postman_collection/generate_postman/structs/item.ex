defmodule FastPostmanCollection.GeneratePostman.Structs.Item do
  defstruct [
    :name,
    :mode,
    :event,
    request: %FastPostmanCollection.GeneratePostman.Structs.Request{}
  ]
end
