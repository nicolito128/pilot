import Config

config :nostrum,
  num_shards: :auto

config :pilot,
  env: Config.config_env(),
  dev_guild_id: System.get_env("DEV_GUILD_ID", "1067309317096747062")

config :logger, :console, metadata: [:shard]

import_config "credentials.exs"
import_config "#{Mix.env()}.exs"

config :nostrum,
  gateway_intents: [
    :message_content,
    :guilds,
    :guild_members,
    :guild_bans,
    :guild_emojis,
    :guild_webhooks,
    :guild_invites,
    :guild_voice_states,
    :guild_messages,
    :guild_message_reactions,
    :direct_messages,
    :direct_message_reactions
  ]
