defmodule Api.Courses.Course do

  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :title, :string
    field :description, :string
    field :price, :decimal
    field :difficulty, :string

    timestamps()
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:title, :description, :price, :difficulty])
    |> validate_required([:title, :description, :price, :difficulty])
  end

end
