# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :verwatch,
  ecto_repos: [Verwatch.Repo]

# Configures the endpoint
config :verwatch, VerwatchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+q93NJiQC5jEO1Z7sSYM5Hfb/4tyNg5qInWnQITCuVaSkqZU/r46dRftjy5QCFJ2",
  render_errors: [view: VerwatchWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Verwatch.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
