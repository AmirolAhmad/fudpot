class MainController < ApplicationController
	
  def index
  	@menus = Menu.paginate(page: params[:page])
  end

end
