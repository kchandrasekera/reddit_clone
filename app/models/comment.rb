class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :parent_comment_id, :user_id

  validates :body, :link_id, :user_id, presence: true

  belongs_to :link

  belongs_to :user

  has_many :children, foreign_key: :parent_comment_id, class_name: "Comment"

  belongs_to :parent_comment, foreign_key: :id, class_name: "Comment"
end
