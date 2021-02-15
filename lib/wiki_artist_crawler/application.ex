defmodule WikiArtistCrawler.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: WikiArtistCrawler.Worker.start_link(arg)
      # {WikiArtistCrawler.Worker, arg}
      # {WikiArtistCrawler.ArtistActivity, name: ArtistActivity, strategy: :one_for_one}
      # %{
      #   id: ArtistActivity,
      #   start: {ArtistActivity, :init, []}
      # }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WikiArtistCrawler.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
