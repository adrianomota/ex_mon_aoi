defmodule ExMonApi.Trainer.Pagination do
  alias ExMonApi.Trainer
  alias ExMonApi.Repo

  def call(params) do
    Trainer
    |> Repo.paginate(params)
  end
end
