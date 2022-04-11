class Article < ApplicationRecord
  # Not advisable
  # Article.unscope to query without default_scope
  # default_scope { where('LENGTH(title) > ?', min_length) }
  scope :long_title, ->(min_length) { where('LENGTH(title) > ?', min_length) }
  scope :has_a_new_comment, -> { joins(:comments).where("comments.created_at > '2020-03-18'") }

  has_many :comments
  has_many :article_advertisements
  has_many :advertisements, through: :article_advertisements
  validates :content, presence: true
  validates :title, presence: true, uniqueness: true

  before_create :set_author_name, :set_comment

  private

  # validate :check_length

  # def check_length
  #   errors.add(:content, 'too long') if !content.nil? && content.length > 5
  # end

  def set_author_name
    return unless author.blank?

    self.author = 'Default Author'
  end

  def set_comment
    return unless comments.empty? && comments.try(:body).blank?

    comments.build(body: 'Default comment')
  end

  def formatted_title
    title.upcase
  end

  # def self.long_title
  #   where('LENGTH(title) > 5')
  # end
end
