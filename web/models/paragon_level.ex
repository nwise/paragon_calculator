defmodule ParagonCalculator.ParagonLevel do
  use ParagonCalculator.Web, :model

  schema "paragon_levels" do
    field :level, :integer
    field :xp_per_level, :integer
    field :xp_total, :integer

    timestamps
  end

  @required_fields ~w(level xp_per_level xp_total)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
