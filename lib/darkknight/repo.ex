defmodule Darkknight.Repo do
  use Ecto.Repo,
    otp_app: :darkknight,
    adapter: Ecto.Adapters.Postgres
end
