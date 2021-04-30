defmodule TruckberWeb.DriverView do
  use TruckberWeb, :view
  alias TruckberWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{data: render_many(drivers, DriverView, "driver.json")}
  end

  def render("show.json", %{driver: driver}) do
    %{data: render_one(driver, DriverView, "driver.json")}
  end

  def render("driver.json", %{driver: driver}) do
    %{id: driver.id,
      name: driver.name,
      email: driver.email}
  end
end
