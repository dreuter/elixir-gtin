defmodule GtinTestdb.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gtin_testdb,
       version: "0.1.0",
       elixir: "~> 1.3",
       build_embedded: Mix.env == :prod,
       start_permanent: Mix.env == :prod,
       description: description,
       description: description,
       package: package,
       deps: deps,
       docs: docs,
   ]
  end

  defp description do
    "A small database of GTIN (EAN-13, EAN-8, ISBN) samples."
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Daniel Reuter"],
      links: %{"GitHub" => "https://github.com/dreuter/elixir-gtin"},
      files: ~w(lib mix.exs README.md LICENSE),
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      # Documentation
      {:earmark, "~> 0.2", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},

      # Testing, Linting, etc.
      {:dogma, "~> 0.1", only: :dev},
    ]
  end
end
