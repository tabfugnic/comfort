class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :user, :commentable_type, :commentable_id
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :content, :commentable_type, :commentable_id, :user_id, presence: true


  def topic
    return commentable unless commentable_type == "Comment"
    return commentable.topic
  end

end
