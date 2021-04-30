defmodule Truckber.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :weight, :string

      timestamps()
    end

  end
end
