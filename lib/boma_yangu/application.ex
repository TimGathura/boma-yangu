defmodule BomaYangu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BomaYanguWeb.Telemetry,
      BomaYangu.Repo,
      {DNSCluster, query: Application.get_env(:boma_yangu, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BomaYangu.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BomaYangu.Finch},
      # Start a worker by calling: BomaYangu.Worker.start_link(arg)
      # {BomaYangu.Worker, arg},
      # Start to serve requests, typically the last entry
      BomaYanguWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BomaYangu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BomaYanguWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
