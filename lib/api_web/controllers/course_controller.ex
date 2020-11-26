defmodule ApiWeb.CourseController do
  use ApiWeb, :controller

  alias Api.Courses

  action_fallback ApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, course} <- Courses.create(params) do
      conn |> put_status(201) |> render("show.json", course: course)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, course} <- Courses.get_course_by_id(id),
    {:ok, course} <- course |> Courses.update(params) do
      conn |> put_status(200) |> render("show.json", course: course)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, course} <- Courses.get_course_by_id(id) do
      conn |> put_status(200) |> render("show.json", course: course)
    end
  end

  def list(conn, _params) do
    courses = Courses.list_courses
    conn |> put_status(200) |> render("list.json", courses: courses)
  end

end
