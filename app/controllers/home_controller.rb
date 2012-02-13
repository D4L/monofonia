class HomeController < ApplicationController
  def index
    @_current_user ||= session[:user]
  end
end
