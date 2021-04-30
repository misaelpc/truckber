defmodule Truckber.Repo do
  use Ecto.Repo,
    otp_app: :truckber,
    adapter: Ecto.Adapters.Postgres
end
