defmodule Discussions.VehicleTest do
  use Discussions.DataCase

  alias Discussions.Vehicle

  describe "cars" do
    alias Discussions.Vehicle.Car

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vehicle.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Vehicle.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Vehicle.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Vehicle.create_car(@valid_attrs)
      assert car.name == "some name"
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehicle.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, %Car{} = car} = Vehicle.update_car(car, @update_attrs)
      assert car.name == "some updated name"
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehicle.update_car(car, @invalid_attrs)
      assert car == Vehicle.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Vehicle.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Vehicle.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Vehicle.change_car(car)
    end
  end
end
