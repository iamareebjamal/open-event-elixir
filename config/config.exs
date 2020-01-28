# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :open_event,
  ecto_repos: [OpenEvent.Repo]

config :open_event, OpenEvent.Repo,
  migration_timestamps: [type: :utc_datetime_usec]

# Configures the endpoint
config :open_event, OpenEventWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hHttHoI9KbXEtWSI/DZOJJrQyYhNLT+PWqfE6MsLCd5XD6L4GCOiHMug1wsqRqwl",
  render_errors: [view: OpenEventWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: OpenEvent.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
