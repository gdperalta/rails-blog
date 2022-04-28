class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_author, only: %i[new create edit update destroy owned]
  before_action :set_associations, only: %i[new create edit update destroy]

  def index
    @articles = Article.all
  end

  def owned
    @articles = @author.articles
  end

  def show
    @comment = @article.comments.build

    i = @article.article_advertisements.count
    @ads = @article.advertisements[rand(i - 1)].ads if i != 0
  end

  def new
    @article = @author.articles.build
    @article.article_categories.build
    @article.article_advertisements.build
  end

  def edit; end

  def create
    @article = @author.articles.build(filter_params)

    if @article.save
      redirect_to @article, notice: 'a new article is created'
    else
      render :new
    end
  end

  def update
    if @article.update(filter_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def template_new
    @categories = Category.all
  end

  def activities
    # fetch 'activities/${type}
    @activities = Article.activities(params[:type])
  end

  private

  def set_author
    @author = current_user.role_users.find_by('role_id': 1).author
  end

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to new_article_path
  end

  def filter_params
    filtered_params = article_params
    article_params[:article_advertisements_attributes].each do |key, value|
      filtered_params[:article_advertisements_attributes].delete(key) if value[:advertisement_id] == '0'
    end

    filtered_params
  end

  def article_params
    params.require(:article).permit(:title, :content, :author_id,
                                    article_categories_attributes: %i[id article_id category_id],
                                    article_advertisements_attributes: %i[id advertisement_id article_id])
  end

  def set_associations
    @advertisements = Advertisement.all

    @activity, @category_id = check_params
  end

  def check_params
    if params['activity'].nil?
      ['', 1]
    else
      activity = params['activity']
      category_id = Category.find_by('name': activity['type']).id
      [activity, category_id]
    end
  end
end
