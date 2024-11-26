defmodule BankPipelineWeb.TransactionController do
  use BankPipelineWeb, :controller

  alias BankPipeline.{Transaction, Repo}

  def index(conn, _params) do
    transactions = Repo.all(Transaction)
    json(conn, transactions)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    %Transaction{}
    |> Transaction.changeset(transaction_params)
    |> Repo.insert()
    |> case do
      {:ok, transaction} ->
        json(conn, transaction)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset})
    end
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Repo.get!(Transaction, id)

    case Repo.update(Transaction.changeset(transaction, transaction_params)) do
      {:ok, transaction} ->
        conn
        |> put_status(:ok)
        |> render(:show, transaction: transaction)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset.errors})
    end
  end

end
