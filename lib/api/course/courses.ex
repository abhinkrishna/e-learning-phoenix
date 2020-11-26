defmodule Api.Courses do

  alias Api.Courses.Course
  alias Api.Repo

  def create(attrs), do: %Course{} |> Course.changeset(attrs) |> Repo.insert

  def update(%Course{} = course,  attrs), do: course |> Course.changeset(attrs) |> Repo.update

  def get_course_by_id(id) do
    case Repo.get(Course, id) do
      nil -> {:error, :invalid_id, "Course with id #{id} does not exist"}
      %Course{} = course -> {:ok, course}
    end
  end

  def list_courses, do: Course |>  Repo.all

end
