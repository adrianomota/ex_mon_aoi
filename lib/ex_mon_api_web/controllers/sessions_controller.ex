defmodule ExMonApiWeb.SessionsController do
  use ExMonApiWeb, :controller

  alias ExMonApiWeb.Auth.Guardian

  action_fallback ExMonApiWeb.FallbackController

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
