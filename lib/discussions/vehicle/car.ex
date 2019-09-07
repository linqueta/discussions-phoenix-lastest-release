defmodule Discussions.Vehicle.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
