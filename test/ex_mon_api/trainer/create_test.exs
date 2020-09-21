defmodule ExMonApi.Trainer.CreateTest do
  use ExMonApi.DataCase, async: true

  use ExMachina

  alias ExMonApi.Trainer

  alias ExMonApi.Trainer.Create

  alias ExMonApi.Repo

  describe "call/1" do
    test "when all params are valid, returns a trainer" do
      params = %{
        email: sequence(:email, &"email-#{&1}@example.com"),
        name: "Adriano",
        password: "123456"
      }

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Adriano"}} = response

      assert count_after > count_before
    end

    test "when there are invalid params, returns  the validation errors" do
      params = %{}

      response = Create.call(params)

      assert {:error, changeset} = response

      assert errors_on(changeset) == %{
               email: ["can't be blank"],
               name: ["can't be blank"],
               password: ["can't be blank"]
             }
    end

    test "when there are email invalid, returns the validation error" do
      params = %{name: "Adriano", email: "xxxxxx", password: "123456"}

      response = Create.call(params)

      assert {:error, changeset} = response

      assert errors_on(changeset) == %{email: ["has invalid format"]}
    end
  end
end
