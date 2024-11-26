defmodule BankPipeline.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :amount, :float
      add :description, :string
      add :status, :string, default: "pending"

      timestamps()
    end
  end
end
