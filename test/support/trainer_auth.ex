defmodule ExMonApi.TrainerAuth do
  @moduledoc """
  Authentication requests as trainer
  """

  import ExMonApi.Factory
  import Plug.Conn

  alias ExMonApiWeb.Auth.Guardian

  def authenticate(conn, trainer \\ insert(:trainer)) do
    {:ok, token, _claims} = Guardian.encode_and_sign(trainer)
    put_req_header(conn, "authorization", "Bearer " <> token)
  end
end
