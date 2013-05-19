class PagesController < ApplicationController
  skip_before_filter :authorize

  def index
    @picked = Product.picked.all 
  end

  def category
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @category = Category.first
    end #begin
    @products = @category.products

    @cs.each_with_index do |category, index|
      if category.id == @category.id 
        @cs[index].active = true
        break
      end #if
    end #each
  end

  def product
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @product = nil
    end #begin
  end

  def about; end

  def contact; end

end #PagesController
