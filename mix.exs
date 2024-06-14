defmodule FastPostmanCollection.MixProject do
  use Mix.Project

  def project do
    [
      app: :fast_postman_collection,
      version: "0.1.6",
      docs: docs(),
      elixir: "~> 1.13",
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      files: ~w(lib .formatter.exs mix.exs README*),
      name: "fast_postman_collection",
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/kalachlegends/fast_postman_collection"}
    ]
  end

  defp description() do
    "FastPostmanCollection generate by your Phoenix Router collection for Postman, ..."
  end

  defp docs() do
    [
      main: "FastPostmanCollection",
      assets: "assets",
      extras: [
        "README.md"
      ],
      pages: [
        "README.md"
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/test_app"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4.1"},
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.7.11", only: :test},
      {:phoenix_ecto, "~> 4.4", only: :test},
      {:ecto_sql, "~> 3.10", only: :test},
      {:postgrex, ">= 0.0.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.8.3", only: :test},
      {:swoosh, "~> 1.5", only: :test},
      {:finch, "~> 0.13", only: :test},
      {:telemetry_metrics, "~> 0.6", only: :test},
      {:telemetry_poller, "~> 1.0", only: :test},
      {:gettext, "~> 0.20", only: :test},
      {:dns_cluster, "~> 0.1.1", only: :test},
      {:bandit, "~> 1.2", only: :test},
      {:hackney, "~> 1.9", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
