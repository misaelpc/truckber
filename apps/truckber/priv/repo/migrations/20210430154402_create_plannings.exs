defmodule Truckber.Repo.Migrations.CreatePlannings do
  use Ecto.Migration

  def change do
    create table(:plannings) do
      add :master_reference, :string
      add :house_reference, :string

      timestamps()
    end

  end
end
