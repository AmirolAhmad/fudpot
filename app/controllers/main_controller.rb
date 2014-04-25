class MainController < ApplicationController
	
  def index
  	@menus = Menu.paginate(page: params[:page])
  	@menu = current_user.menus.build if signed_in?
  end

end
