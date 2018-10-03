class PagesController < ApplicationController
 def home
    @sales = Sale.all
    @rentals = Rental.all
  end

  def mention
    @sales =Sale.all
  end
end
