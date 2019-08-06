class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(login: params[:session][:login].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
