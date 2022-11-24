class AstroflatsController < ApplicationController
  before_action :set_astroflat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      if params[:query].match?(/\d+/)
        params[:query] = params[:query].to_i
        @astroflats = policy_scope(Astroflat.where(price_per_night: params[:query]).or(Astroflat.where(surface_area: params[:query]).or(Astroflat.where(number_of_guests: params[:query]))))
      else
        sql_query = <<~SQL
          astroflats.flat_name @@ :query
          OR astroflats.address @@ :query
          OR astroflats.content @@ :query
        SQL
        @astroflats = policy_scope(Astroflat.where(sql_query, query: "%#{params[:query]}%"))
      end
    else
      @astroflats = policy_scope(Astroflat)
    end
  end

  def dashboard
    authorize Astroflat
    @astroflats = Astroflat.where(user: current_user)
    @bookings = Booking.where(user: current_user)
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
    params.require(:astroflat).permit(:flat_name, :address, :content, :photo, :number_of_guests, :price_per_night, :surface_area)
  end
end
