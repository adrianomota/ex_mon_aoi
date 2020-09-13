defmodule ExMonApi.Trainer.Pokemon do
  @moduledoc """
  Trainer pokemon schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias ExMonApi.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @foreign_key_type Ecto.UUID

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  @required_params [:name, :nickname, :weight, :types, :trainer_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(pokemon, params), do: create_changeset(pokemon, params)

  def create_changeset(module_or_pokemon, params) do
    module_or_pokemon
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> assoc_constraint(:trainer)
    |> validate_length(:nickname, min: 2)
  end

  def update_changeset(pokemon, params) do
    pokemon
    |> cast(params, [:nickname])
    |> validate_required([:nickname])
    |> validate_length(:nickname, min: 2)
  end
end
