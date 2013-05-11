class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :users, :ratings
  validates :name, presence: true

  has_many :ratings
  has_many :users, through: :ratings

  has_many :comments, as: :commentable, include: :comments

  ## Get priority topic based upon aggregate ratings
  def priority
    return 0 if ratings.length == 0
    ratings.inject(0) { |sum, rating| sum + rating.priority } / ratings.length
  end

end
