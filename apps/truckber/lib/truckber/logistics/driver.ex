defmodule Truckber.Logistics.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
