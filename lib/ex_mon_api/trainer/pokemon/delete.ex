defmodule ExMonApi.Trainer.Pokemon.Delete do
  alias ExMonApi.Trainer.Pokemon
  alias ExMonApi.Repo
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid Id format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Pokemon not found"}
      pokemon -> Repo.delete(pokemon)
    end
  end

  defp fetch_pokemon(uuid) do
    Pokemon
    |> Repo.get(uuid)
  end
end
