defmodule Melrhohien.MixProject do
  use Mix.Project

  def project do
    [
      app: :melrhohien,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: true,
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Melrhohien",
      source_url: "https://github.com/youknowcast/melrhohien",
      homepage_url: "https://github.com/youknowcast/melrhohien"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Melrhohien, []},
      extra_applications: [:crypto],
      applications: [
        :logger,
        :sqlite_ecto2,
        :ecto
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:scenic, "~> 0.11.0"},
      {:scenic_driver_local, "~> 0.11.0"},
      {:sqlite_ecto2, "~> 2.2"},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end
end
