# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :melrhohien, Melrhohien.Repo,
  adapter: Sqlite.Ecto2,
  database: "melrhohien.sqlite3"

config :melrhohien, ecto_repos: [Melrhohien.Repo]

# Configure the main viewport for the Scenic application
config :melrhohien, :viewport, %{
  name: :main_viewport,
  size: {1090, 490},
  default_scene: {Melrhohien.Scene.Home, nil},
  drivers: [
    %{
      module: Scenic.Driver.Glfw,
      name: :glfw,
      opts: [resizeable: false, title: "melrhohien"]
    }
  ]
}

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "prod.exs"
