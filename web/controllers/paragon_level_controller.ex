defmodule ParagonCalculator.ParagonLevelController do
  use ParagonCalculator.Web, :controller

  alias ParagonCalculator.ParagonLevel

  plug :scrub_params, "paragon_level" when action in [:create, :update]

  def index(conn, _params) do
    paragon_levels = Repo.all(ParagonLevel)
    render(conn, "index.html", paragon_levels: paragon_levels)
  end

  def new(conn, _params) do
    changeset = ParagonLevel.changeset(%ParagonLevel{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"paragon_level" => paragon_level_params}) do
    changeset = ParagonLevel.changeset(%ParagonLevel{}, paragon_level_params)

    case Repo.insert(changeset) do
      {:ok, _paragon_level} ->
        conn
        |> put_flash(:info, "Paragon level created successfully.")
        |> redirect(to: paragon_level_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    paragon_level = Repo.get!(ParagonLevel, id)
    render(conn, "show.html", paragon_level: paragon_level)
  end

  def edit(conn, %{"id" => id}) do
    paragon_level = Repo.get!(ParagonLevel, id)
    changeset = ParagonLevel.changeset(paragon_level)
    render(conn, "edit.html", paragon_level: paragon_level, changeset: changeset)
  end

  def update(conn, %{"id" => id, "paragon_level" => paragon_level_params}) do
    paragon_level = Repo.get!(ParagonLevel, id)
    changeset = ParagonLevel.changeset(paragon_level, paragon_level_params)

    case Repo.update(changeset) do
      {:ok, paragon_level} ->
        conn
        |> put_flash(:info, "Paragon level updated successfully.")
        |> redirect(to: paragon_level_path(conn, :show, paragon_level))
      {:error, changeset} ->
        render(conn, "edit.html", paragon_level: paragon_level, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    paragon_level = Repo.get!(ParagonLevel, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(paragon_level)

    conn
    |> put_flash(:info, "Paragon level deleted successfully.")
    |> redirect(to: paragon_level_path(conn, :index))
  end
end
