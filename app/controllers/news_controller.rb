class NewsController < ApplicationController

    def show
        @new = News.find(params[:id])
    end
end