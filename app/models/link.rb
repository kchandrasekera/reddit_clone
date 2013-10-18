class Link < ActiveRecord::Base
  attr_accessible :description, :sub_id, :title, :url, :submitter_id

  validates :sub_id, :title, :url, :submitter_id, presence: true

  belongs_to :sub

  belongs_to :submitter, foreign_key: :submitter_id, class_name: "User"

  has_many :comments


  def comments_by_parent_id
    comments = Comment.where(link_id: self.id).includes(:children)
    comments_hash = Hash.new { |hash, key| hash[key] = Array.new }
    comments.each do |comment|
      comments_hash[comment.parent_comment_id] << comment
    end
    comments_hash
  end
end
