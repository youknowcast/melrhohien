defmodule Melrhohien do
  @moduledoc """
  Starter application using the Scenic framework.
  """

  def start(_type, _args) do
    # load the viewport configuration from config
    default_viewport_config = Application.get_env(:melrhohien, :viewport)

    # start the application with the viewport
    children = [
      {Scenic, [default_viewport_config]},
      Melrhohien.Repo
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
