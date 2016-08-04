defmodule Commentator.Comment do
  use Commentator.Web, :model

  schema "comments" do
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body])
    |> validate_required([:body])
  end

  def ordered(query) do
    from q in query,
      order_by: [desc: q.id]
  end
end
