class SessionsController < ApplicationController
	def new
 	end

  	def create
	  	user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password]) && user.validated
	      sign_in user
	      redirect_to beers_path
	  	else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
  	end

  	def destroy
  		sign_out
    	redirect_to beers_path
  	end
end
