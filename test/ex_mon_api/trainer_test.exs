defmodule ExMonApi.TrainerTest do
  use ExMonApi.DataCase, async: true

  alias ExMonApi.Trainer

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{email: "adrianowsh@gmail.com", name: "Adriano", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 name: "Adriano",
                 password: "123456"
               },
               errors: [],
               data: %Trainer{},
               valid?: true
             } = response
    end

    test "when there are invalid params returns an invalid changeset" do
      params = %{email: "adrianowsh@gmail.com", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 email: "adrianowsh@gmail.com",
                 password: "123456"
               },
               data: %Trainer{},
               valid?: false
             } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end

    test "when there are invalid email returns an invalid changeset" do
      params = %{email: "adrianowshgmail.com", name: "Adriano Mota", password: "123456"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 name: "Adriano Mota",
                 email: "adrianowshgmail.com",
                 password: "123456"
               },
               data: %Trainer{},
               valid?: false
             } = response

      assert errors_on(response) == %{email: ["has invalid format"]}
    end
  end

  describe "build/1" do
    test "when all params are valid, returns a trainer struct" do
      params = %{email: "adrianowsh@gmail.com", name: "Adriano", password: "123456"}

      response = Trainer.build(params)

      assert {:ok, %Trainer{email: "adrianowsh@gmail.com", name: "Adriano", password: "123456"}} =
               response
    end

    test "when the are invalid params, returns an error" do
      params = %{email: "adrianowsh@gmail.com", password: "123456"}

      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{valid?: false} = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
