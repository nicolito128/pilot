defmodule Pilot.Plugin do
  @moduledoc """
  Behaviour for plugin implementations
  """

  alias Nostrum.Struct.Interaction
  alias Nostrum.Consumer

  @doc """
  Used to define the spec for the command to be used for command registration.
  See https://hexdocs.pm/nostrum/application-commands.html for more info on the
  required shape for the spec.
  """
  @callback spec() :: map()

  @doc """
  Called when the command is invoked.
  """
  @callback handle(Interaction.t()) :: any()
  @callback handle(Consumer.event()) :: any()
end
