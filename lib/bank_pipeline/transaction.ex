defmodule BankPipeline.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :amount, :description, :status, :inserted_at, :updated_at]}
  schema "transactions" do
    field :amount, :float
    field :description, :string
    field :status, :string

    timestamps()
  end

  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :description, :status])
    |> validate_required([:amount, :description])
  end
end
