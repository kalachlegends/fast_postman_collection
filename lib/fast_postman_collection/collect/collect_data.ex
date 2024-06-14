defmodule FastPostmanCollection.CollectDataItemParams do
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

defmodule FastPostmanCollection.CollectDataItem do
  defstruct [
    :title,
    :documentation,
    :name,
    :filter,
    :route,
    :method,
    :other_variables,
    :pipe_through,
    doc_params: %FastPostmanCollection.CollectDataItemParams{}
  ]
end

defmodule FastPostmanCollection.CollectDataModuleParams do
  defstruct [:folder_path, :filter]

  def get_from_map(doc_params) when is_map(doc_params) do
    struct(__MODULE__, doc_params)
  end
end

defmodule FastPostmanCollection.CollectDataModule do
  defstruct [
    :title,
    :documentation,
    :doc_params,
    :functions,
    :module,
    :other_variables,
    doc_params: %FastPostmanCollection.CollectDataModuleParams{}
  ]
end
