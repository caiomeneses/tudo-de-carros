class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.includes(:brand).order("brands.name", :name, :version, :year)
  end

  def show
    @vehicle = Vehicle.includes(:brand, :technical_spec, :ev_spec, :maintenances, :defects, :reviews, :fipe_prices).find(params[:id])
  end
end
