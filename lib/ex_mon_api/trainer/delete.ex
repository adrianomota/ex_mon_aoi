defmodule ExMonApi.Trainer.Delete do
  alias ExMonApi.Trainer
  alias ExMonApi.Repo
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid Id format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> Repo.delete(trainer)
    end
  end

  defp fetch_trainer(uuid) do
    Trainer
    |> Repo.get(uuid)
  end
end
