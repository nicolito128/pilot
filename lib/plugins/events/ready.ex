defmodule Pilot.Plugins.Events.Ready do
  alias Pilot.Plugin

  @behaviour Plugin

  @impl Plugin
  def spec() do
    %{
      name: "ready"
    }
  end

  @impl Plugin
  def handle({:READY, _data, _ws_state}) do
    IO.puts "Ready for work!!!"
  end
end
