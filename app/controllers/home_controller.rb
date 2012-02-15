class HomeController < ApplicationController
  def index
    @_current_user = session[:cur_user_id] && User.find(session[:cur_user_id])
    @groups = @_current_user.groups if @_current_user
  end
end
