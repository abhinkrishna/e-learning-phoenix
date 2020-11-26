defmodule ApiWeb.PageControllerTest do
  use ApiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "server_up"
  end
end
