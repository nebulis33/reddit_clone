class Post < ApplicationRecord
    validates :title, presence: true
    validates :sub_ids, presence: {message: 'must have at least one sub'}

    has_many :post_subs, inverse_of: :post, dependent: :destroy
    has_many :subs, through: :post_subs, source: :sub
    belongs_to :author, class_name: "User", foreign_key: :author_id

    delegate :username, to: :author, prefix: true
    #delegate :title, to: :subs, prefix: true
end
