defmodule ExMonApiWeb.SessionsView do
  use ExMonApiWeb, :view

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
