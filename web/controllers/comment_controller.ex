defmodule Commentator.CommentController do
  use Commentator.Web, :controller

  alias Commentator.Comment

  def index(conn, _params) do
    changeset = Comment.changeset(%Comment{})
    comments = Comment |> Comment.ordered |> Repo.all
    render(conn, "index.html", %{comments: comments, changeset: changeset})
  end

  def create(conn, %{"comment" => comment_params}) do
    changeset = Comment.changeset(%Comment{}, comment_params)

    case Repo.insert(changeset) do
      {:ok, comment} ->
        changeset = Comment.changeset(%Comment{})
        render(conn, "create.js", comment: comment, changeset: changeset)
      {:error, changeset} ->
        render(conn, "new.js", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    comment = Repo.get!(Comment, id)
    changeset = Comment.changeset(comment)
    render(conn, "edit.js", comment: comment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Repo.get!(Comment, id)
    changeset = Comment.changeset(comment, comment_params)

    case Repo.update(changeset) do
      {:ok, comment} ->
        render(conn, "update.js", comment: comment)
      {:error, changeset} ->
        render(conn, "edit.js", comment: comment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Repo.get!(Comment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(comment)

    render(conn, "delete.js", id: id)
  end
end
