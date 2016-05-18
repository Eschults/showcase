class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to root_path }
      else
        format.js
        format.html { render 'pages/home' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
