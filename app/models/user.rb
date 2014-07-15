class User < ActiveRecord::Base
  has_many :shouts

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :followed_user_relationships,
            class_name: "FollowingRelationship",
            foreign_key: :follower_id

  has_many :followed_users, through: :followed_user_relationships

  def to_param
    username
  end
end
