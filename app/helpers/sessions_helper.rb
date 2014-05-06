module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token  # Create a new token 
		cookies.permanent[:remember_token] = remember_token # and put it in the cookies 
		user.update_attribute(:remember_token, User.digest(remember_token)) # save digest to db 
		self.current_user = user # set current user to be the given user 
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user 
		remember_token = User.digest(cookies[:remember_token])
		# set current_user to @current_user or the user found with find_by(remember_token). 
		@current_user ||= User.find_by(remember_token: remember_token) 
	end

	def sign_out
		current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
