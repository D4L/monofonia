class GroupController < ApplicationController
  def create
    @group = Group.new(params[:group])
    respond_to do |format|
      if @group.save
        session[:user].groups << @group
        redirect_to root_url
      else
        format.html {render :action => "create"}
        @group.errors.clear if !request.post?
        format.json {render :json => @group.errors}
      end
    end
  end
end
