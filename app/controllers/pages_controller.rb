class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    @articles = Article.order(created_at: :desc).last(5)
  end

  def contact
  end
end
