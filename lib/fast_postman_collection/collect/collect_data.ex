defmodule FastPostmanCollection.CollectDataItem do
  defstruct [:title, :documentation, :doc_params, :name]
end

defmodule FastPostmanCollection.CollectDataModule do
  defstruct [:title, :documentation, :doc_params, :functions, :module]
end
