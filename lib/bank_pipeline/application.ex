defmodule BankPipeline.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BankPipelineWeb.Telemetry,
      BankPipeline.Repo,
      {DNSCluster, query: Application.get_env(:bank_pipeline, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BankPipeline.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BankPipeline.Finch},
      # Start a worker by calling: BankPipeline.Worker.start_link(arg)
      # {BankPipeline.Worker, arg},
      # Start to serve requests, typically the last entry
      BankPipelineWeb.Endpoint,
      BankPipeline.TransactionProducer,
      BankPipeline.TransactionProcessor,
      BankPipeline.TransactionConsumer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BankPipeline.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BankPipelineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
