defmodule ExMonApi.Trainer.Pokemon.Update do
  alias ExMonApi.{Trainer.Pokemon, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid Id format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon not found"}
      pokemon -> update_pokemon(Repo.preload(pokemon, :trainer), params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update()
  end
end
