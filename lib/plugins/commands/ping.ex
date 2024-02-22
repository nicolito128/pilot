defmodule Pilot.Plugins.Commands.Ping do
  alias Nostrum.Api
  alias Pilot.Plugin

  @behaviour Plugin

  @impl Plugin
  def spec() do
    %{
      name: "ping",
      description: "A simple health check"
    }
  end

  @impl Plugin
  def handle(interaction) do
    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{content: "pong!"}
    })
  end
end
