class UserController < ApplicationController

  def signup
    @user = User.new(params[:user])
    if request.post?
      if @user.save
        session[:user] = User.authenticate(@user.username, @user.pass)
        redirect_to root_url
      else
      end
    end
  end

  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:pass])
        logger.info ("AOEUAOEUAOEUAOEU")
        redirect_to root_url
      else
        logger.info("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_url
  end
end
