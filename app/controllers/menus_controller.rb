class MenusController < ApplicationController
  before_action :signed_in_user, only: [:index, :create]
  before_action :correct_user,   only: :destroy

  def index
    @menus = Menu.paginate(page: params[:page])
    @menu = current_user.menus.build

    @levels = Level.all
    @categories = Category.all
  end

  def create
    @menu = current_user.menus.new(menu_params) do |t|
      uploaded_io = params[:menu][:image]

      if params[:menu][:image]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
          t.filename = uploaded_io.original_filename
          t.mime_type = uploaded_io.content_type
        end
      end
    end

    if @menu.save
      flash[:success] = "Recipe has been created!"
      redirect_to root_url
    else
      render 'menus/index'
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @level = Level.find(@menu.level_id)
    @category = Category.find(@menu.category_id)
    @user = User.find(@menu.user_id)
  end

  def destroy
    @menu.destroy

    redirect_to current_user
    flash[:success] = "Recipe has been deleted."
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :ingredient, :description, :preparation, :serve, :cooking_time, :level_id, :category_id)
  end

  # Before filters
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, danger: "Please sign in first."
    end
  end

  def correct_user
    @menu = current_user.menus.find_by(id: params[:id])

    redirect_to root_url if @menu.nil?
  end

end