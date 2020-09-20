defmodule ExMonApiWeb.Controller.SessionsControllerTest do
  use ExMonApiWeb.ConnCase, async: true

  import ExMonApi.Factory

  describe "sign_in/2" do
    setup %{conn: conn} do
      insert(:trainer,
        email: "adrianowsh@gmail.com",
        password: "123456"
      )

      %{conn: conn}
    end

    test "when there is a valid trainer with email and password returns token", %{conn: conn} do
      conn =
        post(conn, Routes.sessions_path(conn, :sign_in), %{
          "email" => "adrianowsh@gmail.com",
          "password" => "123456"
        })

      assert %{"token" => _} = json_response(conn, 200)
    end

    test "when there is a invalid trainer with invalid password returns 401", %{conn: conn} do
      conn =
        post(conn, Routes.sessions_path(conn, :sign_in), %{
          "email" => "adrianowsh@gmail.com",
          "password" => "12345"
        })

      assert %{"errors" => %{"detail" => "Unauthorized"}} = json_response(conn, 401)
    end

    test "when there is a invalid trainer with invalid email returns 401", %{conn: conn} do
      conn =
        post(conn, Routes.sessions_path(conn, :sign_in), %{
          "email" => "adrianowsh@gmail.co",
          "password" => "12345"
        })

      assert %{"errors" => %{"detail" => "Unauthorized"}} = json_response(conn, 401)
    end
  end
end
