defmodule Learn.Repo do
  use Ecto.Repo,
    otp_app: :learn,
    adapter: Ecto.Adapters.Postgres
end
