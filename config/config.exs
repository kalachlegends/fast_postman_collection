import Config

config(:fast_collection,
  pipe_tokens: [:admin_auth, :user_auth],
  variables: [
    %{
      key: "host",
      value: "http://localhost:4000"
    }
  ]
)
