class RoleUser < ApplicationRecord
  belongs_to :user
  belongs_to :role
  has_one :author
  before_create :do_author

  def do_author
    reutrn unless role_id == 1
    build_author(name: "Author-#{role_id}-#{user_id}", address: 'N/A')
  end
end
