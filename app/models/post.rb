class Post < ApplicationRecord
    validates :title, presence: true
    validates :sub_ids, presence: {message: 'must have at least one sub'}

    has_many :post_subs, inverse_of: :post, dependent: :destroy
    has_many :subs, through: :post_subs, source: :sub
    has_many :comments, inverse_of: :post
    belongs_to :author, class_name: "User", foreign_key: :author_id

    delegate :username, to: :author, prefix: true
    #delegate :title, to: :subs, prefix: true

    def comments_by_parent
        comments_by_parent = Hash.new { |hash, key| hash[key] = [] }

        self.comments.includes(:author).each do |comment|
            comments_by_parent[comment.parent_comment_id] << comment
        end

        comments_by_parent
    end
end
