class StaticPagesController < ApplicationController
  def home
		@box = current_user.boxes.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

end
