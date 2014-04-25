class MenusController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  	
  end

  def create
  	@menu = current_user.menus.build(menu_params)
    if @menu.save
      flash[:success] = "Recipe created!"
      redirect_to root_url
    else
      render 'main/index'
    end
  end

  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:description, :title, :ingredient)
  end

end