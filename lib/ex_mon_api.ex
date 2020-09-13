defmodule ExMonApi do
  @moduledoc """
  ExMonApi facade
  """
  alias ExMonApi.{Pokemon, Trainer}
  alias ExMonApi.Trainer.Pokemon, as: TrainerPokemon

  defdelegate index(params), to: Trainer.Pagination, as: :call
  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(id), to: Trainer.Delete, as: :call
  defdelegate fetch_trainer(id), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call

  defdelegate fetch_pokemon(name), to: Pokemon.Get, as: :call

  defdelegate fetch_trainer_pokemon(id), to: TrainerPokemon.Get, as: :call
  defdelegate create_trainer_pokemon(params), to: TrainerPokemon.Create, as: :call
  defdelegate delete_trainer_pokemon(id), to: TrainerPokemon.Delete, as: :call
  defdelegate update_trainer_pokemon(params), to: TrainerPokemon.Update, as: :call
end
