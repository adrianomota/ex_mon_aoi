defmodule ExMonApiWeb.Router do
  use ExMonApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ExMonApiWeb.Auth.Pipeline
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ExMonApiWeb.Telemetry
    end
  end

  scope "/api", ExMonApiWeb do
    pipe_through :api

    post "/trainers", TrainersController, :create
    post "/session/signin", SessionsController, :sign_in
    post "/pokemons/:name", PokemonsController, :show
  end

  scope "/api", ExMonApiWeb do
    pipe_through [:api, :auth]

    resources "/trainers", TrainersController, only: [:index, :show, :update, :delete]

    resources "/trainer_pokemons", TrainerPokemonsController,
      only: [:create, :show, :update, :delete]
  end
end
