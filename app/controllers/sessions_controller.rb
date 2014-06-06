class SessionsController < ApplicationController 
	def login
		#Login Form
		# @session = Session.new
	end

    def login_attempt
		authorized_user = User.authenticate(params[:username],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Welcome, you logged in as #{authorized_user.username}"
			render "home"
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end
 	def logout
    	session[:user_id] = nil
    	flash[:notice] = "Logged out Successfullly."
    	redirect_to :action => 'login'
 	end

end
