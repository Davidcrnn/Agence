class ImagesController < ApplicationController
   def destroy
     @image = Image.find(params[:id])
  @image.destroy

  redirect_back(fallback_location: root_path)

  end
end
