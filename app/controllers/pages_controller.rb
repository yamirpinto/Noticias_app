class PagesController < ApplicationController

    def home
        redirect_to news_index_path if logged_in?
    end

    def about
    end

end
