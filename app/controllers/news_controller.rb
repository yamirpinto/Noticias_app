class NewsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @news = News.all
  end

  def new
    @new = News.new
  end
  
  def edit
  end

  def create
    @new = News.new(new_params)
    @new.user = User.first
    if @new.save
      flash[:notice] = "El artículo de noticia ha sido guardado satisfactoriamente."
      redirect_to @new
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @new.update(new_params)
      flash[:notice] = "El artículo de noticia ha sido actualizado satisfactoriamente."
      redirect_to @new
    else
      render 'edit'
    end
  end

  def destroy
    @new.destroy
    redirect_to news_path
  end
  private
    def new_params
      params.require(:news).permit(:title, :subtitle, :author, :description, :link)
    end
    def set_article
      @new = News.find(params[:id])
    end
end