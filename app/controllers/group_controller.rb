class GroupController < ApplicationController
  def create
    if request.post?
      @group = Group.new(params[:group])
      if @group.save
        session[:user].groups << @group
        redirect_to root_url
      end
    end
  end
end
