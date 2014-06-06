class UsersController < ApplicationController
  
  def new
	   @user = User.new
  end

  def create
#Modified to test git hub
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Saved successfully"
	    flash[:color]= "valid"
      redirect_to(:controller=>"sessions",:action => "login")
    else
	    #render :text =>"<pre>"+ "Testing".to_yaml and return
	    flash[:notice] = "Error while saving"
	    flash[:color]= "invalid"
	    render "new"
    end	
  end
end
