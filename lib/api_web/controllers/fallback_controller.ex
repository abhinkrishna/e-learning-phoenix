defmodule ApiWeb.FallbackController do
  use ApiWeb, :controller

  alias ApiWeb.ErrorView
  alias ApiWeb.ChangesetView

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(404)
    |> put_view(ErrorView)
    |> render("error.json", error: "Not found")
  end

  def call(conn, {:error, :invalid_id, message}) do
    conn
    |> put_status(400)
    |> put_view(ErrorView)
    |> render("error.json", error: message)
  end



end
