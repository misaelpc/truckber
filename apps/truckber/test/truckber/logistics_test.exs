defmodule Truckber.LogisticsTest do
  use Truckber.DataCase

  alias Truckber.Logistics

  describe "orders" do
    alias Truckber.Logistics.Order

    @valid_attrs %{status: "some status", weight: "some weight"}
    @update_attrs %{status: "some updated status", weight: "some updated weight"}
    @invalid_attrs %{status: nil, weight: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logistics.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Logistics.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Logistics.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Logistics.create_order(@valid_attrs)
      assert order.status == "some status"
      assert order.weight == "some weight"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logistics.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Logistics.update_order(order, @update_attrs)
      assert order.status == "some updated status"
      assert order.weight == "some updated weight"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Logistics.update_order(order, @invalid_attrs)
      assert order == Logistics.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Logistics.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Logistics.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Logistics.change_order(order)
    end
  end

  describe "plannings" do
    alias Truckber.Logistics.Planning

    @valid_attrs %{house_reference: "some house_reference", master_reference: "some master_reference"}
    @update_attrs %{house_reference: "some updated house_reference", master_reference: "some updated master_reference"}
    @invalid_attrs %{house_reference: nil, master_reference: nil}

    def planning_fixture(attrs \\ %{}) do
      {:ok, planning} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logistics.create_planning()

      planning
    end

    test "list_plannings/0 returns all plannings" do
      planning = planning_fixture()
      assert Logistics.list_plannings() == [planning]
    end

    test "get_planning!/1 returns the planning with given id" do
      planning = planning_fixture()
      assert Logistics.get_planning!(planning.id) == planning
    end

    test "create_planning/1 with valid data creates a planning" do
      assert {:ok, %Planning{} = planning} = Logistics.create_planning(@valid_attrs)
      assert planning.house_reference == "some house_reference"
      assert planning.master_reference == "some master_reference"
    end

    test "create_planning/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logistics.create_planning(@invalid_attrs)
    end

    test "update_planning/2 with valid data updates the planning" do
      planning = planning_fixture()
      assert {:ok, %Planning{} = planning} = Logistics.update_planning(planning, @update_attrs)
      assert planning.house_reference == "some updated house_reference"
      assert planning.master_reference == "some updated master_reference"
    end

    test "update_planning/2 with invalid data returns error changeset" do
      planning = planning_fixture()
      assert {:error, %Ecto.Changeset{}} = Logistics.update_planning(planning, @invalid_attrs)
      assert planning == Logistics.get_planning!(planning.id)
    end

    test "delete_planning/1 deletes the planning" do
      planning = planning_fixture()
      assert {:ok, %Planning{}} = Logistics.delete_planning(planning)
      assert_raise Ecto.NoResultsError, fn -> Logistics.get_planning!(planning.id) end
    end

    test "change_planning/1 returns a planning changeset" do
      planning = planning_fixture()
      assert %Ecto.Changeset{} = Logistics.change_planning(planning)
    end
  end

  describe "drivers" do
    alias Truckber.Logistics.Driver

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def driver_fixture(attrs \\ %{}) do
      {:ok, driver} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logistics.create_driver()

      driver
    end

    test "list_drivers/0 returns all drivers" do
      driver = driver_fixture()
      assert Logistics.list_drivers() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Logistics.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      assert {:ok, %Driver{} = driver} = Logistics.create_driver(@valid_attrs)
      assert driver.email == "some email"
      assert driver.name == "some name"
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logistics.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{} = driver} = Logistics.update_driver(driver, @update_attrs)
      assert driver.email == "some updated email"
      assert driver.name == "some updated name"
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Logistics.update_driver(driver, @invalid_attrs)
      assert driver == Logistics.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Logistics.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Logistics.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Logistics.change_driver(driver)
    end
  end
end
