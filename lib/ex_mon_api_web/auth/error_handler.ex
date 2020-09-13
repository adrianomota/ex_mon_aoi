defmodule ExMonApiWeb.Auth.ErrorHandler do
  @moduledoc """
  Error handler auth pipeline
  """
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  def auth_error(conn, {type, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(type)})

    conn
    |> send_resp(401, body)
  end
end
