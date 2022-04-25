class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit
    end
  end

  def verify
    @author = Author.find(params[:author_id])
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

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :address, :date_verified, :is_verified)
  end
end
