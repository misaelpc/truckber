defmodule TruckberWeb.PlanningController do
  use TruckberWeb, :controller

  alias Truckber.Logistics
  alias Truckber.Logistics.Planning

  action_fallback TruckberWeb.FallbackController

  def index(conn, _params) do
    plannings = Logistics.list_plannings()
    render(conn, "index.json", plannings: plannings)
  end

  def create(conn, %{"planning" => planning_params}) do
    with {:ok, %Planning{} = planning} <- Logistics.create_planning(planning_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.planning_path(conn, :show, planning))
      |> render("show.json", planning: planning)
    end
  end

  def show(conn, %{"id" => id}) do
    planning = Logistics.get_planning!(id)
    render(conn, "show.json", planning: planning)
  end

  def update(conn, %{"id" => id, "planning" => planning_params}) do
    planning = Logistics.get_planning!(id)

    with {:ok, %Planning{} = planning} <- Logistics.update_planning(planning, planning_params) do
      render(conn, "show.json", planning: planning)
    end
  end

  def delete(conn, %{"id" => id}) do
    planning = Logistics.get_planning!(id)

    with {:ok, %Planning{}} <- Logistics.delete_planning(planning) do
      send_resp(conn, :no_content, "")
    end
  end
end
