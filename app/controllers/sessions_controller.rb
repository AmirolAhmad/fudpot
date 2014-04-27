class SessionsController < ApplicationController

	def new
    if current_user
      redirect_to current_user
    else
      @user = User.new
    end
  end

  #def create
  #	user = User.find_by(email: params[:session][:email].downcase)
  #  if user && user.authenticate(params[:session][:password])
  #    sign_in user
  #    redirect_back_or user
  #  else
  #    flash.now[:danger] = 'Invalid email/password combination'
  #    render 'new'
  #  end
  #end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now[:danger] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    #sign_out
    cookies.delete(:auth_token)
    redirect_to root_url, :warning => "Logged out!"
  end

end
