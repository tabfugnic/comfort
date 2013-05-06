class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :users, :ratings
  validates :name, presence: true

  has_many :ratings
  has_many :users, through: :ratings

  def priority
    ratings.inject(0) { |sum, rating| sum + rating.priority } / ratings.length
  end

end
