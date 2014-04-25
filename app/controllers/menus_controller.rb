class MenusController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :destroy]

  def index
    @menus = Menu.paginate(page: params[:page])
    @menu = current_user.menus.build
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

  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :ingredient, :description)
  end

end