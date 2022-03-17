class Article < ApplicationRecord
  has_many :comments
  validates :content, presence: true

  # validate :check_length

  # def check_length
  #   errors.add(:content, 'too long') if !content.nil? && content.length > 5
  # end
end
