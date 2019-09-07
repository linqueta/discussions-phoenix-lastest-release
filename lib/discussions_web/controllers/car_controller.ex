defmodule DiscussionsWeb.CarController do
  use DiscussionsWeb, :controller

  alias Discussions.Vehicle
  alias Discussions.Vehicle.Car

  action_fallback DiscussionsWeb.FallbackController

  def index(conn, _params) do
    cars = Vehicle.list_cars()
    render(conn, "index.json", cars: cars)
  end

  def create(conn, %{"car" => car_params}) do
    with {:ok, %Car{} = car} <- Vehicle.create_car(car_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.car_path(conn, :show, car))
      |> render("show.json", car: car)
    end
  end

  def show(conn, %{"id" => id}) do
    car = Vehicle.get_car!(id)
    render(conn, "show.json", car: car)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = Vehicle.get_car!(id)

    with {:ok, %Car{} = car} <- Vehicle.update_car(car, car_params) do
      render(conn, "show.json", car: car)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Vehicle.get_car!(id)

    with {:ok, %Car{}} <- Vehicle.delete_car(car) do
      send_resp(conn, :no_content, "")
    end
  end
end
