class PagesController < ApplicationController
  def home
    @articles = Article.order(created_at: :desc).last(5)
  end

  def contact
  end
end
