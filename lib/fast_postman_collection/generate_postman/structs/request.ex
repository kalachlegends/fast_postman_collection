defmodule FastPostmanCollection.GeneratePostman.Structs.Request do
  defstruct method: "",
            auth: %{},
            header: [],
            body: nil,
            description: "",
            url: %FastPostmanCollection.GeneratePostman.Structs.Url{}
end
