class UsersController < ApplicationController
  
  def new
	   #Testing user
	   @user = User.new
  end

  def create
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
