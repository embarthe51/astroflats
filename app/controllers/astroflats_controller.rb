class AstroflatsController < ApplicationController
  belongs_to :user
  def index
    @flats = Astroflat.all
  end

  def new
    @flat = Astroflat.new
  end

  # A faire
  # - redirect_to la page de l'astroflat (la show)
  def create
    @flat = Astroflat.new(astroflat_params)
    @flat.user = current_user
    @flat.save
    redirect_to root_path
  end

  private

  def astroflat_params
    params.require(:astroflat).permit(:flat_name, :address, :number_of_guests, :price_per_night, :surface_area)
  end
end
