class PagesController < ApplicationController
  def index
    @picked = Product.picked.all 
  end
end
