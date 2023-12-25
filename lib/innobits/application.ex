defmodule Innobits.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      InnobitsWeb.Telemetry,
      Innobits.Repo,
      {DNSCluster, query: Application.get_env(:innobits, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Innobits.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Innobits.Finch},
      # Start a worker by calling: Innobits.Worker.start_link(arg)
      # {Innobits.Worker, arg},
      # Start to serve requests, typically the last entry
      InnobitsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Innobits.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InnobitsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
