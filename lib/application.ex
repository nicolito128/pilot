defmodule Pilot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc """
  Application entry point to Pilot bot.
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Pilot.Consumer.Supervisor, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    opts = [strategy: :one_for_one, name: Pilot.Supervisor]

    IO.puts "Application started!"
    Supervisor.start_link(children, opts)
  end
end
