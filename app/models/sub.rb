class Sub < ApplicationRecord
    belongs_to :moderator, class_name: "User", foreign_key: :moderator_id
    has_many :posts

    delegate :username, to: :moderator, prefix: true
end
