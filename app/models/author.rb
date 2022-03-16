class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  # validates :date_verified, presence: true
  # validate :verify_date

  # def verify_date
  #   return unless !date_verified.nil? && date_verified > Date.today

  #   errors.add(:date_verified, 'Cannot be verified later than today')
  # end
end
