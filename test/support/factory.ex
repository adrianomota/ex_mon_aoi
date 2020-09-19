defmodule ExMonApi.Factory do
  @moduledoc """
  Ex-machina factory
  """

  use ExMachina.Ecto, repo: ExMonApi.Repo

  alias ExMonApi.Trainer

  def trainer_factpory do
    %Trainer{
      name: "Trainer 1",
      password_hash: Argon2.add_hash("123456")
    }
  end
end
