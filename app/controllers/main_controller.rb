class MainController < ApplicationController
	before_action :signed_in_user, only: [:create]

  	def index
  		@menus = Menu.paginate(page: params[:page])
  	end

  def create
  	@menu = current_user.menus.build if signed_in?
  end

end
