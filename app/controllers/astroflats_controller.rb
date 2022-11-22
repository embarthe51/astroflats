class AstroflatsController < ApplicationController
  before_action :set_astroflat, only: [:show, :edit, :update, :destroy]

  def index
    @astroflats = policy_scope(Astroflat)
  end

  def show
    authorize @astroflat
  end

  def new
    @astroflat = Astroflat.new
    authorize @astroflat
  end

  # A faire
  # - redirect_to la page de l'astroflat (la show)
  def create
    @astroflat = Astroflat.new(astroflat_params)
    @astroflat.user = current_user
    authorize @astroflat
    if @astroflat.save
      redirect_to astroflats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @astroflat
  end

  def update
    authorize @astroflat
    @astroflat.update(astroflat_params)
    redirect_to astroflat_path(@astroflat)
  end

  def destroy
    authorize @astroflat
    @astroflat.destroy
    redirect_to astroflats_path, status: :see_other
  end

  private

  def set_astroflat
    @astroflat = Astroflat.find(params[:id])
  end

  def astroflat_params
    params.require(:astroflat).permit(:flat_name, :address, :number_of_guests, :price_per_night, :surface_area)
  end
end
