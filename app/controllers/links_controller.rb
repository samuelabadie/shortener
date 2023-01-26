class LinksController < ApplicationController

    def create
        link = CreateLink.new(link_params[:original_url]).run # "http://www.google.com"
        redirect_to root_path(link_id: link.id)
    end

    def show
        link = Link.find_by(lookup_code: params['lookup_code'])
        redirect_to(link.original_url, allow_other_host: true)
    end

    private
    # params = { link: { original_url: "http://www.google.com" } }
    # link_params = { original_url: "http://www.google.com" }
    def link_params
        params.require(:link).permit(:original_url)
    end 
    
end