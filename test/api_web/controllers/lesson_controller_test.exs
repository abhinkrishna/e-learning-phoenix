defmodule ApiWeb.LessonController do
  use ApiWeb.ConnCase
  import Api.Factory

  @lesson_attrs %{
    "title" => "test course",
    "description" => "test description",
    "number" => 1
  }

  describe "lesson" do

    setup do
      course = insert(:course)
      # lesson = params_with_assocs(:lesson)
      {:ok, course: course}
    end

    test "create/2 returns 201 with lesson response", %{conn: conn, course: course} do
      lesson_attrs = Map.put(@lesson_attrs, "course_id", course.id)
      conn = post(conn, Routes.lesson_path(conn, :create), lesson_attrs)
      IO.inspect json_response(conn, 201)
      assert %{} = json_response(conn, 201)
    end


  end

end
