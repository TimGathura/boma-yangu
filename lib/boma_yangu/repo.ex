defmodule BomaYangu.Repo do
  use Ecto.Repo,
    otp_app: :boma_yangu,
    adapter: Ecto.Adapters.Postgres
end
