class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]
  after_action :verify_authorized, except: [:index, :show]

  def index
    if params[:category].blank?
      @articles = Article.order(published_on: :desc)
    elsif params[:category] == "Chroniques judiciaires"
      @articles = Article.where(category: "Chroniques judiciaires").order(published_on: :desc)
    elsif params[:category] == "Histoires judiciaires"
      @articles = Article.where(category: "Histoires judiciaires").order(published_on: :desc)
    elsif params[:category] == "Brèves de prétoires"
      @articles = Article.where(category: "Brèves de prétoires").order(published_on: :desc)
    end
  end

  def show
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :category, :published_on, photos: [])
  end
end