defmodule ParagonCalculator.CalculationController do
  use ParagonCalculator.Web, :controller

  alias ParagonCalculator.ParagonLevel

  plug :scrub_params, "calculation" when action in [:create, :update]

  def new(conn, _params) do
  end

  def create(conn, %{"calculation" => calculation_params}) do
  end


  def
end
