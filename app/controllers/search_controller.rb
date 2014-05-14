class SearchController < ApplicationController
  def index
    query = params[:search].present? ? params[:search][:query] : nil
    @articles = Article.search(query)
    @documents = Document.search(query)
    @events = Event.search(query)
    @topics = Topic.search(query)
    @services = Service.search(query)
    @videos = Video.search(query)
  end
end

