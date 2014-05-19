class BoxesController < ApplicationController
	before_action :signed_in_user

	def create
		@box = current_user.boxes.build(box_params)
		if @box.save
			flash[:success] = "New bento created!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

	private

		def box_params
			params.require(:box).permit(:content, :made_date) # ... oh. 

		end
end
