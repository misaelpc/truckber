defmodule TruckberWeb.PlanningControllerTest do
  use TruckberWeb.ConnCase

  alias Truckber.Logistics
  alias Truckber.Logistics.Planning

  @create_attrs %{
    house_reference: "some house_reference",
    master_reference: "some master_reference"
  }
  @update_attrs %{
    house_reference: "some updated house_reference",
    master_reference: "some updated master_reference"
  }
  @invalid_attrs %{house_reference: nil, master_reference: nil}

  def fixture(:planning) do
    {:ok, planning} = Logistics.create_planning(@create_attrs)
    planning
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all plannings", %{conn: conn} do
      conn = get(conn, Routes.planning_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create planning" do
    test "renders planning when data is valid", %{conn: conn} do
      conn = post(conn, Routes.planning_path(conn, :create), planning: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.planning_path(conn, :show, id))

      assert %{
               "id" => id,
               "house_reference" => "some house_reference",
               "master_reference" => "some master_reference"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.planning_path(conn, :create), planning: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update planning" do
    setup [:create_planning]

    test "renders planning when data is valid", %{conn: conn, planning: %Planning{id: id} = planning} do
      conn = put(conn, Routes.planning_path(conn, :update, planning), planning: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.planning_path(conn, :show, id))

      assert %{
               "id" => id,
               "house_reference" => "some updated house_reference",
               "master_reference" => "some updated master_reference"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, planning: planning} do
      conn = put(conn, Routes.planning_path(conn, :update, planning), planning: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete planning" do
    setup [:create_planning]

    test "deletes chosen planning", %{conn: conn, planning: planning} do
      conn = delete(conn, Routes.planning_path(conn, :delete, planning))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.planning_path(conn, :show, planning))
      end
    end
  end

  defp create_planning(_) do
    planning = fixture(:planning)
    %{planning: planning}
  end
end
