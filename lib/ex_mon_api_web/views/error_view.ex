defmodule ExMonApiWeb.ErrorView do
  use ExMonApiWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Phoenix.Controller

  def template_not_found(template, _assigns) do
    %{
      errors: %{
        detail: Controller.status_message_from_template(template)
      }
    }
  end

  def render("400.json", %{result: %Ecto.Changeset{} = result}) do
    %{message: translate_errors(result)}
  end

  def render("400.json", %{result: message}) do
    %{message: message}
  end

  def render("401.json", %{result: message}) do
    %{message: message}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
