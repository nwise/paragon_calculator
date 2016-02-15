defmodule ParagonCalculator.ParagonLevelTest do
  use ParagonCalculator.ModelCase

  alias ParagonCalculator.ParagonLevel

  @valid_attrs %{level: 42, xp_per_level: 42, xp_total: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ParagonLevel.changeset(%ParagonLevel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ParagonLevel.changeset(%ParagonLevel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
