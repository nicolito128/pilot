defmodule Pilot.Plugins do
  alias Nostrum.Api
  alias Pilot.Plugins.{
    Commands,
    Events
  }

  @plugins %{
    "ping" => { Commands.Ping, kind: :command },
    "ready" => { Events.Ready, kind: :event }
  }

  @plugin_specs for { _name, { plugin, kind } } <- @plugins, do: Map.merge(plugin.spec(), %{kind: kind})

  @plugin_names for { name, _ } <- @plugins, do: name

  def load_plugins() do
    commands = get_command_specs()
    write_application_commands(commands)
  end

  def get_command_specs() do
    @plugin_specs |> Enum.filter(fn spec -> spec.kind == :command end)
  end

  def get_plugin_by_name(name, kind \\ :command) do
    { plugin, kind: ^kind } = Map.get(@plugins, name)
    plugin
  end

  def write_application_commands(commands) do
    # Global application commands take a couple of minutes to update in Discord,
    # so we use a test guild when in dev mode.
    if Application.get_env(:pilot, :env) == :dev do
      guild_id = Application.get_env(:pilot, :dev_guild_id)
      Api.bulk_overwrite_guild_application_commands(guild_id, commands)
    else
      Api.bulk_overwrite_global_application_commands(commands)
    end
  end

  def handle_interaction(interaction) do
    if interaction.data.name in @plugin_names do
      command = get_plugin_by_name(interaction.data.name, :command)
      command.handle(interaction)
    else
      :ok
    end
  end

  def handle_event(event_name, event) when is_bitstring(event_name) and is_tuple(event) do
    plugin = get_plugin_by_name(event_name, :event)
    if event != nil do
      plugin.handle(event)
    end
  end
end
