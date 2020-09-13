defmodule ExMonApi.Trainer.Update do
  @moduledoc """
  Trainer update
  """
  alias Ecto.UUID
  alias ExMonApi.{Repo, Trainer}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid Id format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp fetch_trainer(uuid) do
    Trainer
    |> Repo.get(uuid)
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp update_trainer(trainer, params) do
    trainer
    |> Trainer.changeset(params)
    |> Repo.update()
  end
end
