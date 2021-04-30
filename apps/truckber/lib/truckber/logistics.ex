defmodule Truckber.Logistics do
  @moduledoc """
  The Logistics context.
  """

  import Ecto.Query, warn: false
  alias Truckber.Repo

  alias Truckber.Logistics.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  alias Truckber.Logistics.Planning

  @doc """
  Returns the list of plannings.

  ## Examples

      iex> list_plannings()
      [%Planning{}, ...]

  """
  def list_plannings do
    Repo.all(Planning)
  end

  @doc """
  Gets a single planning.

  Raises `Ecto.NoResultsError` if the Planning does not exist.

  ## Examples

      iex> get_planning!(123)
      %Planning{}

      iex> get_planning!(456)
      ** (Ecto.NoResultsError)

  """
  def get_planning!(id), do: Repo.get!(Planning, id)

  @doc """
  Creates a planning.

  ## Examples

      iex> create_planning(%{field: value})
      {:ok, %Planning{}}

      iex> create_planning(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_planning(attrs \\ %{}) do
    %Planning{}
    |> Planning.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a planning.

  ## Examples

      iex> update_planning(planning, %{field: new_value})
      {:ok, %Planning{}}

      iex> update_planning(planning, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_planning(%Planning{} = planning, attrs) do
    planning
    |> Planning.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a planning.

  ## Examples

      iex> delete_planning(planning)
      {:ok, %Planning{}}

      iex> delete_planning(planning)
      {:error, %Ecto.Changeset{}}

  """
  def delete_planning(%Planning{} = planning) do
    Repo.delete(planning)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking planning changes.

  ## Examples

      iex> change_planning(planning)
      %Ecto.Changeset{data: %Planning{}}

  """
  def change_planning(%Planning{} = planning, attrs \\ %{}) do
    Planning.changeset(planning, attrs)
  end

  alias Truckber.Logistics.Driver

  @doc """
  Returns the list of drivers.

  ## Examples

      iex> list_drivers()
      [%Driver{}, ...]

  """
  def list_drivers do
    Repo.all(Driver)
  end

  @doc """
  Gets a single driver.

  Raises `Ecto.NoResultsError` if the Driver does not exist.

  ## Examples

      iex> get_driver!(123)
      %Driver{}

      iex> get_driver!(456)
      ** (Ecto.NoResultsError)

  """
  def get_driver!(id), do: Repo.get!(Driver, id)

  @doc """
  Creates a driver.

  ## Examples

      iex> create_driver(%{field: value})
      {:ok, %Driver{}}

      iex> create_driver(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_driver(attrs \\ %{}) do
    %Driver{}
    |> Driver.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a driver.

  ## Examples

      iex> update_driver(driver, %{field: new_value})
      {:ok, %Driver{}}

      iex> update_driver(driver, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_driver(%Driver{} = driver, attrs) do
    driver
    |> Driver.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a driver.

  ## Examples

      iex> delete_driver(driver)
      {:ok, %Driver{}}

      iex> delete_driver(driver)
      {:error, %Ecto.Changeset{}}

  """
  def delete_driver(%Driver{} = driver) do
    Repo.delete(driver)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking driver changes.

  ## Examples

      iex> change_driver(driver)
      %Ecto.Changeset{data: %Driver{}}

  """
  def change_driver(%Driver{} = driver, attrs \\ %{}) do
    Driver.changeset(driver, attrs)
  end
end
