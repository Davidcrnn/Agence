class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
    @rentals = Rental.order('created_at DESC')
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
    @picture = @rental.pictures.build
  end

  def create
    @rental = Rental.create!(rental_params)
    # @rental = Rental.new(rental_params)

      respond_to do |format|
    if @rental.save
      if params[:pictures]
        params[:pictures].each do |picture|
          @rental.pictures.create(picture: picture)
        end
      end

      format.html { redirect_to @rental, notice: 'rental was successfully created.' }
      format.json { render action: 'show', status: :created, location: @rental }
    else
      format.html { render action: 'new' }
      format.json { render json: @rental.errors, status: :unprocessable_entity }
    end
  end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
        respond_to do |format|
      if @rental.update(rental_params)
        if params[:pictures]
          params[:pictures].each do |picture|
            @rental.pictures.create(picture: picture)
          end
        end
        format.html { redirect_to @rental, notice: 'rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to rentals_path
  end

  private

  def rental_params
    params.require(:rental).permit(:titre, :description, :photos, :surface, :top, :price, :visible, :localisation, pictures_attributes: [:picture, :rental_id])
  end
end
