require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#formatted_title' do
    it 'returns an uppercase title' do
      art = Article.create(title: 'lowercase title', content: 'My content')

      expect(art.formatted_title).to eq('LOWERCASE TITLE')
    end
  end

  #   class methods (mostly queries)
  describe '.long_title' do
    it 'returns all titles with a length greater than 5' do
      Article.create(title: 'lowercase title', content: 'My content')
      Article.create(title: 'short', content: 'My content')

      p Article.all.pluck(:title)
      expect(Article.long_title.size).to eq(1)
    end
  end

  context 'validations' do
    let!(:article) { Article.new }

    it 'is not a valid content' do
      article.title = 'My Title'

      expect(article).to_not be_valid
      expect(article.errors).to be_present
      expect(article.errors.to_hash.keys).to include(:content)
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'is not a unique title' do
      Article.create(title: 'My title', content: 'My content')
      same_article = Article.create(title: 'My title', content: 'My second content')

      expect(same_article).to_not be_valid
      expect(same_article.errors).to be_present
      expect(same_article.errors.to_hash.keys).to include(:title)
      expect(same_article.errors[:title]).to include('has already been taken')
    end

    it 'is not a valid title' do
      article.content = 'My Content'

      expect(article).to_not be_valid
      expect(article.errors).to be_present
      expect(article.errors.to_hash.keys).to include(:title)
      expect(article.errors[:title]).to include("can't be blank")
    end
  end
end
