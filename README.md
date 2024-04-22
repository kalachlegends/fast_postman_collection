# FastCollection

This library exists for generate your collection by Phoenix Router `MyApp.Router`.
You can write your documentation by doc_params
![collection](./images/collection.png)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fast_collection` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fast_collection, "~> 0.1.0"}
  ]
end
```

Configure fast collection

- pipe_tokens -> put in your auth bearer
- router -> your router
- variables -> variables collection
- file_path_collection -> rewrite where will be your file collection

```elixir
config(:fast_collection,
  pipe_tokens: [:admin_auth, :user_auth],
  name_collection: "My collection",
  router: MyApp.Router,
  variables: [
    %{
      key: "host",
      value: "http://localhost:4000"
    }
  ]
)
```

configure your controller

```elixir
defmodule TestAppWeb.UserController do
  use TestAppWeb, :controller
  @moduledoc filter: "test"
  # Artem will be name in collection
  @moduledoc """
  # Artem
  """
  # Index route will be name in collection
  @doc """
  # Index route
  This route will be in collection
  """
  @doc params: %{
    limit: 0,
    page: %{
      key: "page",
      value: 1,
      description: "artem"
    },
  }
  def index(conn, params) do
    json(conn, params)
  end
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/fast_collection>.

## Examples doc_params

This will be put on your url as limit?=10

```elixir
@doc params: %{
    limit: 0,
    page: %{
      key: "page",
      value: 1,
      description: "artem"
    },
  }
  def index(conn, params) do
    json(conn, params)
  end
```

This will be put on your body and automate mode will be json

```elixir
@doc body: %{
    user: %{
      admin: ""
    }
  }
  def create_user(conn, params) do
    json(conn, params)
  end
```

## About authrization

All tokens puts and scans from your pipelines

### example

router.ex

```elixir
 scope "/user" do
      pipe_through(:admin_auth)
      get("/", UserController, :index)
end
```

config.exs

```elixir
 scope "/user" do
      pipe_through(:admin_auth)
      get("/", UserController, :index)
end
```

will be there in bearer in token
![token](./images/token.png)

And use for put your token

```elixir
 @doc auth_pre_request: %{is_enabled: true, from_resp_token: "token", variable_token: "admin_variable"}
```

## about folder

You can use `@moduledoc folder_path: "Admin"`
and this put your module function to this folder

### Example

```elixir
defmodule MyAppWeb.AdminUserController do
  use MyAppWeb, :controller
  @moduledoc folder_path: "Admin"
  # this module puts to /admin/user controller
  @moduledoc """
  # user controller
  """

end
```
