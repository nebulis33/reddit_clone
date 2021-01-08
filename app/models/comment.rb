class Comment < ApplicationRecord
    validates :content, presence: true

    belongs_to :post, inverse_of: :comments
    belongs_to :author, class_name: "User", foreign_key: :author_id
    belongs_to :parent_comment, class_name: "Comment", foreign_key: :parent_comment_id, optional: true
    has_many :child_comments, class_name: "Comment", foreign_key: :parent_comment_id
    has_many :votes, as: :voteable

    def votes_sum
        self.votes.sum(:value)
    end
end
