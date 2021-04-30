defmodule Truckber.Logistics.Planning do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plannings" do
    field :house_reference, :string
    field :master_reference, :string

    timestamps()
  end

  @doc false
  def changeset(planning, attrs) do
    planning
    |> cast(attrs, [:master_reference, :house_reference])
    |> validate_required([:master_reference, :house_reference])
  end
end
