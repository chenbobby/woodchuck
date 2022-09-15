defmodule Woodchuck.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Woodchuck.LogMaker
    ]

    opts = [strategy: :one_for_one, name: Woodchuck.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
