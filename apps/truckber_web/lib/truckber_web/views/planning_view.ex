defmodule TruckberWeb.PlanningView do
  use TruckberWeb, :view
  alias TruckberWeb.PlanningView

  def render("index.json", %{plannings: plannings}) do
    %{data: render_many(plannings, PlanningView, "planning.json")}
  end

  def render("show.json", %{planning: planning}) do
    %{data: render_one(planning, PlanningView, "planning.json")}
  end

  def render("planning.json", %{planning: planning}) do
    %{id: planning.id,
      master_reference: planning.master_reference,
      house_reference: planning.house_reference}
  end
end
