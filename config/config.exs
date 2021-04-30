# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :truckber,
  ecto_repos: [Truckber.Repo]

config :truckber_web,
  ecto_repos: [Truckber.Repo],
  generators: [context_app: :truckber]

# Configures the endpoint
config :truckber_web, TruckberWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TA9aXIzFpX42P+pObNMMLqSRr8hsMgBlGekmTYTuYqGTE1743m5gqvnMs4AGwERi",
  render_errors: [view: TruckberWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Truckber.PubSub,
  live_view: [signing_salt: "rTcv9nvN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
