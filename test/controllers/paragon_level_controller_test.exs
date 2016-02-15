defmodule ParagonCalculator.ParagonLevelControllerTest do
  use ParagonCalculator.ConnCase

  alias ParagonCalculator.ParagonLevel
  @valid_attrs %{level: 42, xp_per_level: 42, xp_total: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, paragon_level_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing paragon levels"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, paragon_level_path(conn, :new)
    assert html_response(conn, 200) =~ "New paragon level"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, paragon_level_path(conn, :create), paragon_level: @valid_attrs
    assert redirected_to(conn) == paragon_level_path(conn, :index)
    assert Repo.get_by(ParagonLevel, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, paragon_level_path(conn, :create), paragon_level: @invalid_attrs
    assert html_response(conn, 200) =~ "New paragon level"
  end

  test "shows chosen resource", %{conn: conn} do
    paragon_level = Repo.insert! %ParagonLevel{}
    conn = get conn, paragon_level_path(conn, :show, paragon_level)
    assert html_response(conn, 200) =~ "Show paragon level"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, paragon_level_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    paragon_level = Repo.insert! %ParagonLevel{}
    conn = get conn, paragon_level_path(conn, :edit, paragon_level)
    assert html_response(conn, 200) =~ "Edit paragon level"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    paragon_level = Repo.insert! %ParagonLevel{}
    conn = put conn, paragon_level_path(conn, :update, paragon_level), paragon_level: @valid_attrs
    assert redirected_to(conn) == paragon_level_path(conn, :show, paragon_level)
    assert Repo.get_by(ParagonLevel, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    paragon_level = Repo.insert! %ParagonLevel{}
    conn = put conn, paragon_level_path(conn, :update, paragon_level), paragon_level: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit paragon level"
  end

  test "deletes chosen resource", %{conn: conn} do
    paragon_level = Repo.insert! %ParagonLevel{}
    conn = delete conn, paragon_level_path(conn, :delete, paragon_level)
    assert redirected_to(conn) == paragon_level_path(conn, :index)
    refute Repo.get(ParagonLevel, paragon_level.id)
  end
end
