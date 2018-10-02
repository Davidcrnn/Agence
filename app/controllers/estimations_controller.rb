class EstimationsController < ApplicationController
   def new
    @estimation = Estimation.new
  end

  def create
    @estimation = Estimation.new(params[:estimation])
    @estimation.request = request
    if @estimation.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
