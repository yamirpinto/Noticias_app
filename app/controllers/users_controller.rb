class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "Tu información de usuario ha sido correctamente actualizada"
        redirect_to news_index_path
      else
        render 'edit'
      end
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Bienvenido a Noticias Genosur #{@user.username}, Te has conectado exitosamente."
        redirect_to news_index_path
      else
        render 'new'
      end
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end