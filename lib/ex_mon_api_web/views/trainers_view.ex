defmodule ExMonApiWeb.TrainersView do
  use ExMonApiWeb, :view

  alias ExMon.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{
      data: %{
        id: id,
        name: name
      }
    }
  end
end
