class UserController < ApplicationController

  def signup
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:cur_user_id] = User.authenticate(@user.username, @user.pass).id
        redirect_to root_url
      else
        format.html {render :action => "signup"}
        @user.errors.clear if !request.post?
        format.json {render :json => @user.errors}
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
