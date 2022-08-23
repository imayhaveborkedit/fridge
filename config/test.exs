import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
import_config "db.secret.exs"

config :fridge, Fridge.Repo,
  database: "fridge_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fridge, FridgeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4003],
  secret_key_base: "LczTQ3uiUymFwttoZpehrEbZwrCXwfrHPWFSTWFPdsBzvZTSi1giYYa+6Z3kfRTr",
  server: false

# In test we don't send emails.
config :fridge, Fridge.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
