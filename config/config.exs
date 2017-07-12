# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_gql,
  ecto_repos: [ElixirGql.Repo]

# Configures the endpoint
config :elixir_gql, ElixirGql.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8+QpLWn1MT1U46O0fzJ1tAaxFIduiwzyMYHcu/wMa+d6Xtgen+b1RehZP6LTvPzJ",
  render_errors: [view: ElixirGql.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirGql.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "ElixirGql",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: "KOeamQDCqBOW/MM/a3ZMyrpXjqLhnykpmhtxzbWAQ31uBkh375vfveIWDiLC2JuH",
  serializer: ElixirGql.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
