defmodule ExMonApiWeb.TrainerPokemonsView do
  use ExMonApiWeb, :view
  alias ExMonApi.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      data: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      data: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer: %{id: trainer_id, name: trainer_name},
        weight: weight
      }
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      data: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer: %{id: trainer_id, name: trainer_name},
        weight: weight
      }
    }
  end
end
