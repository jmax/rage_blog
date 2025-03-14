class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, notice: "Comment was successfully created."
    else
      redirect_to @article, alert: "Comment could not be created."
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: "Comment was successfully destroyed."
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
