class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
      @news = @user.news
    end
    
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "Tu información de usuario ha sido correctamente actualizada"
        redirect_to @user
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

    def destroy
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Cuenta de usuario y noticias asociadas eliminadas."
      redirect_to news_index_path
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user
        flash[:alert] = "Sólo puedes editar tu propio perfil."
        redirect_to @user
      end
    end



end