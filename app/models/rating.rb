class Rating < ActiveRecord::Base

  attr_accessible :comfort, :interest, :user_id, :topic_id

  validates_numericality_of :comfort, :interest, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  belongs_to :topic
  belongs_to :user

  def priority
    ( ( 100 - comfort ) + interest ) / 2
  end

end
