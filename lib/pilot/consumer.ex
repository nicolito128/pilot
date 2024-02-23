defmodule Pilot.Consumer do
  # See https://hexdocs.pm/nostrum/0.8.0/Nostrum.Consumer.html
  # for more information about Consumer behaviour.
  use Nostrum.Consumer

  alias Pilot.Plugins

  def handle_event({:READY, _data, _ws_state} = event) do
    Plugins.load_plugins()

    Plugins.handle_event("ready", event)
  end

  def handle_event({:INTERACTION_CREATE, interaction, _ws_state}) do
    Plugins.handle_interaction(interaction)
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
