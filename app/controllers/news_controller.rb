class NewsController < ApplicationController

  def show
    @new = News.find(params[:id])
  end

  def index
    @news = News.all
  end

  def new
    @new = News.new
  end

  def create
    @new = News.new(new_params)
    if @new.save
      flash[:notice] = "El artículo de noticia ha sido guardado satisfactoriamente."
      redirect_to @new
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def new_params
      params.require(:news).permit(:title, :subtitle, :author, :description, :link)
    end
end