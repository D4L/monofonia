class GroupController < ApplicationController
  def create
    @group = Group.new(params[:group])
    respond_to do |format|
      if @group.save
        User.find(session[:cur_user_id]).groups << @group
        format.html {redirect_to root_url}
        format.json {head :no_content}
      else
        format.html {render :action => "create"}
        @group.errors.clear if !request.post?
        format.json {render :json => @group.errors}
      end
    end
  end
  def index
    @groups = @_current_user.groups if @_current_user
  end
end
