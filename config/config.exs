# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :commentator,
  ecto_repos: [Commentator.Repo]

# Configures the endpoint
config :commentator, Commentator.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QRj41kbzF43negjwvO1SECKnOnrdabrQcljsY8hDjZ9VV0teXNQWx6OfuxqmMf/3",
  render_errors: [view: Commentator.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Commentator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
