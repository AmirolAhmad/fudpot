class MenusController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
    @menus = Menu.paginate(page: params[:page])
    @menu = current_user.menus.build
  end

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      flash[:success] = "Recipe created!"
      redirect_to root_url
    else
      render 'menus/index'
    end
  end

  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :ingredient, :description)
  end

end