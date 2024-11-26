defmodule BankPipeline.Repo do
  use Ecto.Repo,
    otp_app: :bank_pipeline,
    adapter: Ecto.Adapters.Postgres
end
