defmodule ParagonCalculator.Repo.Migrations.CreateParagonLevel do
  use Ecto.Migration

  def change do
    create table(:paragon_levels) do
      add :level, :integer
      add :xp_per_level, :bigint
      add :xp_total, :bigint

      timestamps
    end

  end
end
