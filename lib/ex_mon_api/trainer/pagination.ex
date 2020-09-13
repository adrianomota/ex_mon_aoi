defmodule ExMonApi.Trainer.Pagination do
  @moduledoc """
  Trainer pagination
  """
  alias ExMonApi.{Repo, Trainer}

  def call(params) do
    Trainer
    |> Repo.paginate(params)
  end
end
