defmodule Pilot.Plugins.Events.Ready do
  @moduledoc """
  Ready event process.
  """
  alias Pilot.Plugin

  @behaviour Plugin

  @spec spec() :: map()
  @impl Plugin
  def spec() do
    %{
      name: "ready"
    }
  end

  @spec handle(Nostrum.Consumer.event()) :: any()
  @impl Plugin
  def handle({:READY, _data, _ws_state}) do
    IO.puts "Ready for work!!!"
  end
end
