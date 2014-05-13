class SearchController < ApplicationController
  def index
    @articles = Article.search(params[:search][:query])
    @documents = Document.search(params[:search][:query])
    @events = Event.search(params[:search][:query])
    @services = Service.search(params[:search][:query])
    @videos = Video.search(params[:search][:query])
  end
end

