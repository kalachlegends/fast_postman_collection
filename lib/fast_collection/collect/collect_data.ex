defmodule FastCollection.CollectDataItemParams do
  defstruct [
    :mode,
    :raw,
    :formdata,
    :body,
    :url_variable,
    :params,
    :auth_pre_request,
    body_disabled: true
  ]

  def get_from_map(doc_params) when is_map(doc_params) do
    struct(__MODULE__, doc_params)
  end
end

defmodule FastCollection.CollectDataItem do
  defstruct [
    :title,
    :documentation,
    :name,
    :filter,
    :route,
    :method,
    :pipe_through,
    doc_params: %FastCollection.CollectDataItemParams{}
  ]
end

defmodule FastCollection.CollectDataModuleParams do
  defstruct [:folder_path, :filter]

  def get_from_map(doc_params) when is_map(doc_params) do
    struct(__MODULE__, doc_params)
  end
end

defmodule FastCollection.CollectDataModule do
  defstruct [
    :title,
    :documentation,
    :doc_params,
    :functions,
    :module,
    doc_params: %FastCollection.CollectDataModuleParams{}
  ]
end
