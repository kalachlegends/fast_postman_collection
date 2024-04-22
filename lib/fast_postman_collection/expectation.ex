defmodule FastPostmanCollection.Expectation.PhoenixRouterNotFound do
  defexception message: """
               Not found phoenix router in config or function
               use it for configuration your router:
               config :fast_postman_collection,
                  router: MyApp.Router
               """,
               status: 500
end

defmodule FastPostmanCollection.Expectation.GiveTokenAuth do
  defexception message: """
               Should write which token you using
               example @doc auth_pre_request: %{is_enabled: true, from_resp_token: "token", variable_token: "admin_variable"}
               token -> from jsonData
               object token -> collectionVariables
               you should use yours pipe_tokens:
               """,
               status: 500
end
