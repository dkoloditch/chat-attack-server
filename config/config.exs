# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :websockets_test, WebsocketsTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3KTytyuDXfirzxMt/uZcnCtY7Mt3fW+7cfZXb7siz66WDWM8249O7q8jImZ8u1pk",
  render_errors: [view: WebsocketsTest.ErrorView, accepts: ~w(json)],
  pubsub: [name: WebsocketsTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :exredis,
  host: "127.0.0.1",
  port: 6379,
  password: "",
  db: 0,
  reconnect: :no_reconnect,
  max_queue: :infinity
