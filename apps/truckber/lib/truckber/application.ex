defmodule Truckber.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Truckber.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Truckber.PubSub}
      # Start a worker by calling: Truckber.Worker.start_link(arg)
      # {Truckber.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Truckber.Supervisor)
  end
end
