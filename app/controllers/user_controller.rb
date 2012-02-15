class UserController < ApplicationController

  def signup
    @user = User.new(params[:user])
    if request.post?
      if @user.save
        session[:cur_user_id] = User.authenticate(@user.username, @user.pass).id
        redirect_to root_url
      else
      end
    end
  end

  def login
    if request.post?
      if session[:cur_user_id] = User.authenticate(params[:user][:username], params[:user][:pass]).id
        redirect_to root_url
      else
      end
    end
  end

  def logout
    session[:cur_user_id] = nil
    redirect_to root_url
  end
end
