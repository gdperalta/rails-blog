class Advertisement < ApplicationRecord
  has_many :article_advertisements
  has_many :articles, through: :article_advertisements

  def ads
    case name
    when "men's clothing"
      i = rand(1..4)
    when 'jewelry'
      i = rand(5..8)
    when 'electronics'
      i = rand(9..14)
    when "women's clothing"
      i = rand(15..20)
    end
    Product::Client.product(i)
  end
end
