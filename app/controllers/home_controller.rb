class HomeController < ApplicationController
  def index
    @link = Link.find(params[:link_id]) if params[:link_id]
  end
end
