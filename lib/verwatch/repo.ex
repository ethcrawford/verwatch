defmodule Verwatch.Repo do
  use Ecto.Repo,
    otp_app: :verwatch,
    adapter: Ecto.Adapters.Postgres
end
