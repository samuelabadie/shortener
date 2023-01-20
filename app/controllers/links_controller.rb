class LinksController < ApplicationController

    def create
        shortener = Shortener.new(link_params[:origial_url])
        @link = shortener.generate_short_link
    end

    def link_params
        params.require(:link).permit(:origial_url)
    end 
end