defmodule FastPostmanCollection.GenerateCollection.Structs.Info do
  defstruct _postman_id: "#{:rand.uniform(60000)}",
            name: "Collection",
            schema: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
            _exporter_id: "#{:rand.uniform(60000)}"
end
