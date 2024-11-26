defmodule BankPipeline.TransactionConsumer do
  use GenStage

  alias BankPipeline.{Repo, Transaction}

  def start_link(_) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:consumer, :ok}
  end

  def handle_events(events, _from, state) do
    Enum.each(events, fn event ->
      %Transaction{}
      |> Transaction.changeset(event)
      |> Repo.insert()
    end)

    {:noreply, [], state}
  end
end
