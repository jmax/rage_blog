class Api::ArticlesController < ApplicationController
  def index
    articles = Article.includes(:comments).all
    render json: ArticleSerializer.new(articles).serializable_hash
  end

  def show
    article = Article.includes(:comments).find(params[:id])
    render json: ArticleSerializer.new(article).serializable_hash
  end

  def comments
    article = Article.find(params[:article_id])
    comments = article.comments
    render json: CommentSerializer.new(comments).serializable_hash
  end
end
