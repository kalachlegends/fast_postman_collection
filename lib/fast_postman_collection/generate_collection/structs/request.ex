defmodule FastPostmanCollection.GenerateCollection.Structs.Request do
  defstruct method: "",
            auth: %{},
            header: [],
            body: nil,
            description: "",
            url: %FastPostmanCollection.GenerateCollection.Structs.Url{}
end
