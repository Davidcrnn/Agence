class PicturesController < ApplicationController
  def destroy
    # @location = Location.find(params[:id])
    @picture = Picture.find(params[:id])
  @picture.destroy
  redirect_back(fallback_location: root_path)


end
end
