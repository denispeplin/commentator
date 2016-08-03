defmodule Commentator.PageController do
  use Commentator.Web, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: comment_path(conn, :index))
  end
end
