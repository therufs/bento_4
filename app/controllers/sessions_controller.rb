class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password]) # is authenticate included free? 
			sign_in user  # aha, a stub!!
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination' # could be more helpful ... 
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
