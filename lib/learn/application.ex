defmodule Learn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LearnWeb.Telemetry,
      # Start the Ecto repository
      Learn.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Learn.PubSub},
      # Start Finch
      {Finch, name: Learn.Finch},
      # Start the Endpoint (http/https)
      LearnWeb.Endpoint
      # Start a worker by calling: Learn.Worker.start_link(arg)
      # {Learn.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Learn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LearnWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
