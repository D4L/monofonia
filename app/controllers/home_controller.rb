class HomeController < ApplicationController
  def index
    @_current_user = session[:cur_user_id] && User.find(session[:cur_user_id])
  end
end
