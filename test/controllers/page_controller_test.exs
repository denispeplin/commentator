defmodule Commentator.PageControllerTest do
  use Commentator.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert redirected_to(conn) == comment_path(conn, :index)
  end
end
