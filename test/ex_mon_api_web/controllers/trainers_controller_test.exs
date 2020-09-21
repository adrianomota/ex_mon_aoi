defmodule ExMonApiWeb.Controller.TrainersControllerTest do
  use ExMonApiWeb.ConnCase, async: true
  use ExMachina

  alias ExMonApi.Trainer
  alias ExMonApiWeb.Auth.Guardian

  describe "show/2" do
    setup %{conn: conn} do
      params = %{
        email: sequence(:email, &"email-#{&1}@example.com"),
        name: "trainer 1",
        password: "123456"
      }

      {:ok, trainer} = ExMonApi.create_trainer(params)

      {:ok, token, _claims} = Guardian.encode_and_sign(trainer)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn}
    end

    test "when there is a trainer with the given email, returns the trainer", %{conn: conn} do
      params = %{
        email: sequence(:email, &"email-#{&1}@example.com"),
        name: "adriano",
        password: "123456"
      }

      {:ok, %Trainer{id: id}} = ExMonApi.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"data" => %{"id" => id, "name" => "adriano"}} == response
    end

    test "when there is an error with the given id, returns the error", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "1234"))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid Id format"}

      assert expected_response == response
    end
  end
end
