defmodule BankPipeline.TransactionProducer do
  use GenStage

  def start_link(_) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:producer, :queue.new()}
  end

  def handle_demand(demand, state) do
    events = for _ <- 1..demand, do: %{amount: :rand.uniform(1000), description: "Transaction"}
    {:noreply, events, state}
  end
end
