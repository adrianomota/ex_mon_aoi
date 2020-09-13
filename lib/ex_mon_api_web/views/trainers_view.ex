defmodule ExMonApiWeb.TrainersView do
  use ExMonApiWeb, :view
  alias ExMonApi.Trainer

  def render("sign_in.json", %{token: token}), do: %{token: token}

  def render("index.json", %{page: page}) do
    %{
      trainers: Enum.map(page.entries, &trainer_to_json/1),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{
      data: %{
        id: id,
        name: name
      }
    }
  end

  def render("create.json", %{trainer: %Trainer{id: id, name: name}, token: token}) do
    %{
      data: %{
        id: id,
        name: name
      },
      token: token
    }
  end

  def render("update.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{
      data: %{
        id: id,
        name: name
      }
    }
  end

  defp trainer_to_json(trainer) do
    %{
      id: trainer.id,
      name: trainer.name
    }
  end
end
