defmodule BankPipeline.TransactionProcessor do
  use GenStage

  def start_link(_) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:producer_consumer, :ok}
  end

  def handle_events(events, _from, state) do
    processed_events =
      Enum.map(events, fn event ->
        Map.put(event, :status, "processed")
      end)

    {:noreply, processed_events, state}
  end
end
