class UsersController < ApplicationController
  # before_action :authenticate_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Usuário foi criado com sucesso!"
      sign_in(@user)
    else
      render action: :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :login, :password, :password_confirmation)
  end
end
