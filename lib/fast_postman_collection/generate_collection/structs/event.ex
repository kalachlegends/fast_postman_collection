defmodule FastPostmanCollection.GenerateCollection.Structs.Event do
  alias FastPostmanCollection.CollectDataItemParams
  defstruct listen: "test", script: %{}, type: "text/javascript"

  def generate(collect_item_params = %CollectDataItemParams{}) do
    generate_auth_pre_request(collect_item_params) ++ []
  end

  def generate_auth_pre_request(doc_params = %CollectDataItemParams{}) do
    is_enable = doc_params.auth_pre_request[:is_enabled] || false

    if is_enable do
      token =
        doc_params.auth_pre_request[:from_resp_token] ||
          raise FastPostmanCollection.Expectation.GiveTokenAuth

      object_str =
        doc_params.auth_pre_request[:variable_token] ||
          raise FastPostmanCollection.Expectation.GiveTokenAuth

      [
        %__MODULE__{
          listen: "test",
          script: %{
            exec: [
              "pm.test(\"Get token\", function () {\n",
              "    var jsonData = pm.response.json();",
              "    let bearerToken = jsonData.#{object_str};",
              "    pm.collectionVariables.set(\"#{token}\", bearerToken);",
              "});"
            ],
            type: "text/javascript"
          }
        }
      ]
    else
      []
    end
  end
end
