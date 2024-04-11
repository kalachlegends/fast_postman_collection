defmodule FastPostmanCollection.Expectation.PhoenixRouterNotFound do
  defexception message: """
               Not found phoenix router in config or function
               use it for configuration your router:
               config :fast_postman_collection,
                  router: MyApp.Router
               """,
               status: 500
end
