defmodule Commanded.Registration.Global.MixProject do
  use Mix.Project

  def project do
    [
      app: :commanded_global_registry,
      version: "0.1.0",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      description: description(),
      docs: docs(),
      package: package(),
      start_permanent: Mix.env() == :prod
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded,
       git: "https://github.com/uberbrodt/commanded", tag: "master", runtime: Mix.env() == :test},
      {:ex_doc, "~> 0.19", only: :dev},
      {:jason, "~> 1.1"},
      {:local_cluster, "~> 1.0", only: [:test]},
      {:mox, "~> 0.5", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description do
    "A Commanded.Registration implementation using :global as a distributed process registry"
  end

  defp docs() do
    [main: Commanded.Registration.GlobalRegistry]
  end

  defp elixirc_paths(:test) do
    [
      "lib",
      "test/support",
      "deps/commanded/test/registration/support",
      "deps/commanded/test/support"
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      # files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Chris Brodt"],
      licenses: ["MIT"],
      source_url: "https://github.com/uberbrodt/commanded_global_registry",
      links: %{"Github" => "https://github.com/uberbrodt/commanded_global_registry"}
    ]
  end
end
