defmodule ApiWeb.LessonController do
  use ApiWeb, :controller

  action_fallback ApiWeb.FallbackController

  def create(_conn, params) do
    IO.puts "-----------------------------------"
    IO.inspect params
    IO.puts "-----------------------------------"
  end


end
