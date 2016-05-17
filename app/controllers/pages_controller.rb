class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    @articles = Article.where.not(category: "Brèves de prétoires").order(published_on: :desc)
  end

  def contact
  end
end
