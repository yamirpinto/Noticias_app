class NewsController < ApplicationController

  def show
    @newShow = News.find(params[:id])
  end

  def index
    @news = News.all
  end

  def new

  end

  def create
    @new = News.new(params.require(:new).permit(:title, :subtitle, :author, :description, :link))
    @new.save
  end


end