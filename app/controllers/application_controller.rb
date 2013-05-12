class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :categories

  private 
  
  def categories
    @cs = Category.sorted.all
  end

  helper_method :categories

end
