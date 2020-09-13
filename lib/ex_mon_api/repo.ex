defmodule ExMonApi.Repo do
  @moduledoc """
  Trainer Repository
  """
  use Ecto.Repo,
    otp_app: :ex_mon_api,
    adapter: Ecto.Adapters.Postgres

  use Scrivener
end
