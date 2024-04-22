defmodule FastCollection.GenerateCollection.Structs.Request do
  defstruct method: "",
            auth: %{},
            header: [],
            body: nil,
            description: "",
            url: %FastCollection.GenerateCollection.Structs.Url{}
end
