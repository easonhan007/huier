#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :categories, :authorize

  private 
  
  def categories
    @cs = Category.sorted.all
  end

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to admin_login_url, notice: '请登陆'
    end
  end

  helper_method :categories

end
