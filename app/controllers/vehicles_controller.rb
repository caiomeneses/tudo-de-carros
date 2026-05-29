class VehiclesController < ApplicationController
  def index
    vehicles        = Vehicle.includes(:brand, :ev_spec, :technical_spec).order("brands.name", :name, :year)
    @vehicle_groups = vehicles.group_by { |v| [ v.brand_id, v.name ] }.values
    @brands         = Brand.joins(:vehicles).distinct.order(:name)
  end

  def model
    @brand    = Brand.all.find { |b| b.slug == params[:brand_slug] }
    raise ActiveRecord::RecordNotFound unless @brand

    @vehicles = Vehicle.includes(:brand, :ev_spec, :technical_spec, :fipe_prices)
                       .where(brand: @brand)
                       .select { |v| v.model_slug == params[:model_slug] }
                       .sort_by { |v| [-v.year, v.version] }

    raise ActiveRecord::RecordNotFound if @vehicles.empty?

    @model_name = @vehicles.first.name
  end

  def show
    @vehicle = Vehicle.includes(:brand, :technical_spec, :ev_spec, :maintenances, :defects, :reviews, :fipe_prices).find(params[:id])
  end
end
