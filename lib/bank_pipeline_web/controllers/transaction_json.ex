defmodule BankPipelineWeb.TransactionJSON do
  alias BankPipeline.Transaction

  # Renderiza a lista de transações
  def render("index.json", %{transactions: transactions}) do
    %{data: Enum.map(transactions, &transaction_to_map/1)}
  end

  # Renderiza uma única transação
  def render("show.json", %{transaction: transaction}) do
    %{data: transaction_to_map(transaction)}
  end

  # Função auxiliar para converter a transação em um mapa
  defp transaction_to_map(%Transaction{} = transaction) do
    %{
      id: transaction.id,
      amount: transaction.amount,
      description: transaction.description,
      status: transaction.status,
      inserted_at: transaction.inserted_at,
      updated_at: transaction.updated_at
    }
  end
end
