defmodule ExMonApi.Factory do
  @moduledoc """
    Ex-machina factory
  """
  use ExMachina.Ecto, repo: ExMonApi.Repo

  alias ExMonApi.{Trainer, Trainer.Pokemon}

  def trainer_factory do
    %Trainer{
      email: sequence(:email, &"email-#{&1}@example.com"),
      name: "Trainer 1",
      password_hash: Argon2.hash_pwd_salt("123456")
    }
  end

  def pokemon_factory do
    %Pokemon{
      name: "Pokemon 1",
      nickname: "nickname",
      weight: 30,
      types: ["eletric"]
    }
  end
end
