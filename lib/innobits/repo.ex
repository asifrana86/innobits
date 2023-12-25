defmodule Innobits.Repo do
  use Ecto.Repo,
    otp_app: :innobits,
    adapter: Ecto.Adapters.Postgres
end
