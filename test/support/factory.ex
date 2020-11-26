defmodule Api.Factory do

  alias Api.Courses.Course

  use ExMachina.Ecto, repo: Api.Repo

  def course_factory do
    %Course{
      title: "Test Course",
      description: "This is a test course",
      price: 1000,
      difficulty: "beginner"
    }
  end

  def lesson_factory do

  end

end
