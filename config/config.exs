# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :objective_test_api,
  ecto_repos: [ObjectiveTestApi.Repo]

# Configures the endpoint
config :objective_test_api, ObjectiveTestApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pQ4H7VSSvPiNP89U1mjFM4ItQ5CQiPzUAWCnndqlDDUoBXfxueLiuTrS8MaBAO+v",
  render_errors: [view: ObjectiveTestApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ObjectiveTestApi.PubSub,
  live_view: [signing_salt: "QAAqkSp6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures CORS 
config :cors_plug,
  origin: ["http://localhost:3000"],
  max_age: 86400,
  methods: ["GET", "POST"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
