defmodule ExMonApi.Repo.Migrations.CreateTrainer do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string, null: false
      add :name, :string
      add :password_hash, :string
      timestamps(type: :utc_datetime_usec)
    end
  end
end
