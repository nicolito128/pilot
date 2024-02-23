defmodule Pilot.Plugin do
  @moduledoc """
  Behaviour for plugin implementations.
  """

  alias Nostrum.Struct.Interaction
  alias Nostrum.Consumer

  @doc """
  Used to define the spec for the plugin to be used for command registration or event handling.
  See https://hexdocs.pm/nostrum/application-commands.html for more info on the
  required shape for the spec.
  """
  @callback spec() :: map()

  @doc """
  Called when the plugin is invoked.
  """
  @callback handle(Interaction.t() | Consumer.event()) :: any()
end
