defmodule TruckberWeb.DriverController do
  use TruckberWeb, :controller

  alias Truckber.Logistics
  alias Truckber.Logistics.Driver

  action_fallback TruckberWeb.FallbackController

  def index(conn, _params) do
    drivers = Logistics.list_drivers()
    render(conn, "index.json", drivers: drivers)
  end

  def create(conn, %{"driver" => driver_params}) do
    with {:ok, %Driver{} = driver} <- Logistics.create_driver(driver_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.driver_path(conn, :show, driver))
      |> render("show.json", driver: driver)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Logistics.get_driver!(id)
    render(conn, "show.json", driver: driver)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Logistics.get_driver!(id)

    with {:ok, %Driver{} = driver} <- Logistics.update_driver(driver, driver_params) do
      render(conn, "show.json", driver: driver)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Logistics.get_driver!(id)

    with {:ok, %Driver{}} <- Logistics.delete_driver(driver) do
      send_resp(conn, :no_content, "")
    end
  end
end
