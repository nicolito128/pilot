import Config

config :nostrum,
  token: System.get_env("DISCORD_API_TOKEN", "super secret token")
