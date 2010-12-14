class ArticlesController < ApplicationController
  layout :set_layout

  def index
    @articles = Article.index(params[:page] || 1)
  end


  private

  def set_layout
    params[:page] && action_name == "index" ? false : "application"  
  end
end
