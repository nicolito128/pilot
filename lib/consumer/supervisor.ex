defmodule Pilot.Consumer.Supervisor do
  # See https://hexdocs.pm/elixir/1.12/Supervisor.html
  # for information on OTP Supervisor.
  use Supervisor

  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [Pilot.Consumer]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
