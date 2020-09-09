defmodule ExMonApiWeb.TrainersController do
  use ExMonApiWeb, :controller

  action_fallback ExMonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer()
    |> handle_reponse(conn)
  end

  @spec handle_reponse({:ok, any}, Plug.Conn.t()) :: Plug.Conn.t()
  defp handle_reponse({:ok, trainer}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", trainer: trainer)
  end

  defp handle_reponse({:error, _changeset} = error, _conn), do: error
end
