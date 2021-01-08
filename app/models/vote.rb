class Vote < ApplicationRecord
    validates :user_id, uniqueness: {scope: [:voteable_id, :voteable_type]}
    belongs_to :voteable, polymorphic: true
    belongs_to :user, inverse_of: :vote
end
