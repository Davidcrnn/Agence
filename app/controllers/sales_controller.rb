class SalesController < ApplicationController
  def index
    @sales = Sale.all
    @sales = Sale.order('created_at DESC')
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
    @image = @sale.images.build
  end

  def create
    @sale = Sale.create!(sale_params)
     # @sale = sale.new(sale_params)

  respond_to do |format|
    if @sale.save
      if params[:images]
        params[:images].each do |image|
          @sale.images.create(image: image)
        end
      end

      format.html { redirect_to @sale, notice: 'sale was successfully created.' }
      format.json { render action: 'show', status: :created, location: @sale }
    else
      format.html { render action: 'new' }
      format.json { render json: @sale.errors, status: :unprocessable_entity }
    end
  end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    respond_to do |format|
      if @sale.update(sale_params)
        if params[:images]
          params[:images].each do |image|
            @sale.images.create(image: image)
          end
        end
        format.html { redirect_to @sale, notice: 'sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_path
  end

  private

  def sale_params
    params.require(:sale).permit(:titre, :visible, :description, :photo, :surface, :top, :price, :localisation, images_attributes: [:image, :sale_id])
  end
end
