defmodule ObjectiveTestApi.Repo do
  use Ecto.Repo,
    otp_app: :objective_test_api,
    adapter: Ecto.Adapters.Postgres
end
