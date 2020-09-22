defmodule ExMonApi.Trainer.Create do
  @moduledoc """
  Trainer create
  """
  alias ExMonApi.Trainer

  def call(params) do
    params
    |> Trainer.build()
    |> create_trainer()
  end

  defp create_trainer({:ok, struct}), do: {:ok, struct}

  defp create_trainer({:error, _changeset} = error), do: error
end
