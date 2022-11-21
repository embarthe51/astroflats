class AstroflatsController < ApplicationController
  def index
    @flats = Astroflat.all
  end

  def new
    @flat = Astroflat.new
  end

  # A faire
  # - avant de créer l'astroflat, ajouter l'user_id (avec current_user)
  # - terminer la fonctionalité de create
  # - redirect_to la page de l'astroflat
  def create
    @flat = Astroflat.new(astroflat_params)
    # raise
  end

  private

  def astroflat_params
    params.require(:astroflat).permit(:flat_name, :address, :number_of_guests, :price_per_night, :surface_area)
  end
end
