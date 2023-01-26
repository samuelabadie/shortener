class LinksController < ApplicationController

    def create
    shortener = Shortener.new(link_params[:origial_url]) # "http://www.google.com"
    link = shortener.run
    redirect_to root_path(link_id: link.id)
    end

    private
    # params = { link: { origial_url: "http://www.google.com" } }
    # link_params = { origial_url: "http://www.google.com" }
    def link_params
        params.require(:link).permit(:origial_url)
    end 
end