class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :subs, class_name: "Sub", foreign_key: :moderator_id, inverse_of: :moderator
  has_many :posts, class_name: "Post", foreign_key: :author_id, inverse_of: :author
  has_many :comments, class_name: "Comment", foreign_key: :author_id, inverse_of: :author
end
