defmodule ExMonApi.Trainer.Get do
  alias ExMonApi.Trainer
  alias ExMonApi.Repo
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid Id format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> {:ok, trainer}
    end
  end
end
