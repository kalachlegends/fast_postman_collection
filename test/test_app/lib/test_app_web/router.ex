defmodule TestAppWeb.Router do
  use TestAppWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :admin_auth do
    plug(:accepts, ["json"])
  end

  pipeline :user_auth do
    plug(:accepts, ["json"])
  end

  scope "/api", TestAppWeb do
    pipe_through(:api)

    scope "/user" do
      pipe_through(:user_auth)
      get("/", UserController, :index)
      get("/sasd", UserController, :some_uniq_function)
      post("/post-admin-test", PostController, :index)
    end

    scope "/admin" do
      pipe_through(:admin_auth)
      get("/", AdminController, :index)
      get("/admin-post-index", AdminPostController, :index)
      get("/admin-post_create", AdminPostController, :create_post)
      get("/someting-user", AdminUserController, :index)
    end
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:test_app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: TestAppWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
