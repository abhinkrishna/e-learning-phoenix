defmodule Api.Repo.Migrations.CreateCourses do
  use Ecto.Migration
  def change do
    create table(:courses) do
      add :title, :string
      add :description, :string
      add :price, :decimal
      add :difficulty, :string

      timestamps()
    end
  end
end
