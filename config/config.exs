# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_mon_api,
  ecto_repos: [ExMonApi.Repo]

# Configures the endpoint
config :ex_mon_api, ExMonApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TMB59HV98Xs1j0goA+XzW/swGJ+JXQJ0jh95jQLgzdCBjZXt2ppgQN4R1N3YOz5/",
  render_errors: [view: ExMonApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMonApi.PubSub,
  live_view: [signing_salt: "LZ9kowzj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian
config :ex_mon_api, ExMonApiWeb.Auth.Guardian,
  issuer: "ex_mon_api",
  secret_key: "8icrLFYKjzte/ucuSG4NHjLHbDhk4CN+GrNm0zD3DHTiggyowEibkVi7tDzqBSlh"

# Guardian Pipeline
config :ex_mon_api, ExMonApiWeb.Auth.Pipeline,
  module: ExMonApiWeb.Auth.Guardian,
  error_handler: ExMonApiWeb.Auth.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
