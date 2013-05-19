#encoding: utf-8
class Admin::SessionsController < ApplicationController
  skip_before_filter :categories, :authorize
  layout 'login'
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.password == params[:password].strip
      session[:user_id] = user.id
      redirect_to admin_products_path
    else
      redirect_to admin_login_url, alert: '错误的用户名或密码'
    end #if
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_url, notice: '退出登录'
  end
end
