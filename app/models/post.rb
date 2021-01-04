class Post < ApplicationRecord
    belongs_to :sub
    belongs_to :author, class_name: "User", foreign_key: :author_id

    delegate :username, to: :author, prefix: true
    delegate :title, to: :sub, prefix: true
end
