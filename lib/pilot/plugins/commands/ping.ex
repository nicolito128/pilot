defmodule Pilot.Plugins.Commands.Ping do
  @moduledoc """
  Ping application command process.
  """
  alias Nostrum.Api
  alias Pilot.Plugin

  @behaviour Plugin

  @spec spec() :: map()
  @impl Plugin
  def spec() do
    %{
      name: "ping",
      description: "A simple health check"
    }
  end

  @spec handle(Nostrum.Struct.Interaction.t()) :: any()
  @impl Plugin
  def handle(interaction) do
    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{content: "pong!"}
    })
  end
end
