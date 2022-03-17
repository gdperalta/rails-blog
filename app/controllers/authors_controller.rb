class AuthorsController < ApplicationController
  before_action :set_article, only: %i[show edit update verify destroy]

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(article_params)

    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  def update
    if @author.update(article_params)
      redirect_to @author
    else
      render :edit
    end
  end

  def verify
    @author.is_verified = true
    @author.date_verified = Date.today.to_s
    @author.save
    redirect_to authors_path
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def set_article
    @author = Author.find(params[:id])
  end

  def article_params
    params.require(:author).permit(:name, :address, :date_verified, :is_verified)
  end
end
