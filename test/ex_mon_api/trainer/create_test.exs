defmodule ExMonApi.Trainer.CreateTest do
  use ExMonApi.DataCase, async: true

  alias ExMonApi.Trainer

  alias ExMonApi.Trainer.Create

  alias ExMonApi.Repo

  describe "call/1" do
    test "when all params are valid, returns a trainer" do
      params = %{email: "adrianowsh@gmail.com", name: "Adriano", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Adriano"}} = response

      assert count_after > count_before
    end

    test "when there are invalid params, returns the error" do
      params = %{email: "adrianowsh@gmail.com", name: "Adriano"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
