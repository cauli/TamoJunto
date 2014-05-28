class SearchController < ApplicationController
  def index
    query = params[:search].present? ? params[:search][:query] : nil
    @articles = Article.search(query)
    @documents = Document.search(query)
    @events = Event.visible.search(query)
    @topics = Topic.search(query)
    @services = Service.visible.search(query)
    @videos = Video.search(query)
  end
end
