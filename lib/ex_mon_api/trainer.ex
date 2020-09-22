defmodule ExMonApi.Trainer do
  @moduledoc """
  Trainer schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias ExMonApi.{Repo, Trainer.Pokemon}

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @mail_regex ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/

  schema "trainers" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many(:pokemon, Pokemon)
    timestamps(type: :utc_datetime_usec)
  end

  @required_params [:email, :name, :password]

  def build(params) do
    params
    |> changeset()
    |> Repo.insert()
  end

  @spec changeset(:invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          Ecto.Changeset.t()
  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  def changeset(trainer, params), do: create_changeset(trainer, params)

  defp create_changeset(module_or_trainer, params) do
    module_or_trainer
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(:email, name: :email_index)
    |> validate_email(:email)
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset

  defp validate_email(changeset, field) do
    changeset
    |> validate_format(field, @mail_regex)
  end
end
