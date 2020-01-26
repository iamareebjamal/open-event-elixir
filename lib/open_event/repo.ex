defmodule OpenEvent.Repo do
  use Ecto.Repo,
    otp_app: :open_event,
    adapter: Ecto.Adapters.Postgres
end
