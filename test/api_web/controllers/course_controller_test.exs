defmodule ApiWeb.CourseControllerTest do
  use ApiWeb.ConnCase
  import Api.Factory

  @course_attrs %{
    title: "test course",
    description: "test description",
    price: 1000.0,
    difficulty: "beginner",
  }

  describe "course" do

    setup do
      courses = insert_list(2, :course, @course_attrs)
      course = List.first(courses)
      {:ok, course: course, courses: courses}
    end

    test "create/2 returns 201 with course response", %{conn: conn} do
      conn = post(conn, Routes.course_path(conn, :create), @course_attrs)
      assert %{
        "data" => %{
          "description" => "test description",
          "difficulty" => "beginner",
          "id" => _id,
          "price" => "1000",
          "title" => "test course"
        }
      } = json_response(conn, 201)
    end

    test "create/2 returns 422 when no params sended", %{conn: conn} do
      conn = post(conn, Routes.course_path(conn, :create))
      assert %{
        "errors" => %{
          "description" => ["can't be blank"],
          "difficulty" => ["can't be blank"],
          "price" => ["can't be blank"],
          "title" => ["can't be blank"]
        }
      } = json_response(conn, 422)
    end

    test "update/2 returns 200 and updated course response", %{conn: conn, course: course} do
      conn = put(conn, Routes.course_path(conn, :update, course.id), @course_attrs)
      assert %{
        "data" => %{
          "description" => "test description",
          "difficulty" => "beginner",
          "id" => _id,
          "price" => "1000",
          "title" => "test course"
        }
      } = json_response(conn, 200)
    end

    test "update/2 returns 404 when tried to update an non existing course", %{conn: conn} do
      conn = put(conn, Routes.course_path(conn, :update, 0), @course_attrs)
      assert %{"error" => "Course with id 0 does not exist"} = json_response(conn, 400)
    end

    test "show/1 returns 200 when a valid is passed", %{conn: conn, course: course} do
      conn = get(conn, Routes.course_path(conn, :show, course.id))
      assert %{
        "data" => %{
          "description" => "test description",
          "difficulty" => "beginner",
          "id" => _id,
          "price" => "1000",
          "title" => "test course"
        }
      } = json_response(conn, 200)
    end

    test "show/1 returns 400 when a invalid is passed", %{conn: conn} do
      conn = get(conn, Routes.course_path(conn, :show, 0))
      assert %{"error" => "Course with id 0 does not exist"} =  json_response(conn, 400)
    end

    test "list/1 returns all courses", %{conn: conn} do
      conn = get(conn, Routes.course_path(conn, :list))
      assert %{
        "data" => [
          %{
            "description" => "test description",
            "difficulty" => "beginner",
            "id" => _id1,
            "price" => "1000",
            "title" => "test course"
          },
          %{
            "description" => "test description",
            "difficulty" => "beginner",
            "price" => "1000",
            "id" => _id2,
            "title" => "test course"
          }
        ]
      } = json_response(conn, 200)
    end

  end

end
