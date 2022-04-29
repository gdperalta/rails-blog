class Article < ApplicationRecord
  scope :long_title, ->(min_length) { where('LENGTH(title) > ?', min_length) }
  scope :has_a_new_comment, -> { joins(:comments).where("comments.created_at > '2020-03-18'") }

  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :article_advertisements, dependent: :destroy
  has_many :advertisements, through: :article_advertisements
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  accepts_nested_attributes_for :article_advertisements, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :article_categories
  validates :content, presence: true
  validates :title, presence: true, uniqueness: true

  def self.activities(type)
    activities = []
    i = 0
    until i == 6
      activity = ActivityGenerator::Client.type(type)

      next if activities.any? { |data| data.key == activity.key }

      activities.push(activity)
      i += 1
    end

    activities
  end

  def formatted_title
    title.capitalize
  end
end
