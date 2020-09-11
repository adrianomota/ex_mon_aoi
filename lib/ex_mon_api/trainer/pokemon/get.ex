defmodule ExMonApi.Trainer.Pokemon.Get do
  alias ExMonApi.Trainer.Pokemon
  alias ExMonApi.Repo
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid Id format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon not found"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
