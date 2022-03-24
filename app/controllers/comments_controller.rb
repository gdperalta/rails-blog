class CommentsController < ApplicationController
  before_action :get_article, only: %i[index new create]

  def index
    @comments = @article.comments
  end

  def new
    @comment = @article.comments.build
  end

  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_comments_path(@article.id)
    else
      render :new
    end
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
