class Menu < ActiveRecord::Base
	belongs_to :user
	has_many :levels
	has_many :categories
	default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 50 }
	validates :ingredient, presence: true, length: { maximum: 10000 }
	validates :description, presence: true, length: { maximum: 10000 }
	validates :filename, presence: true
	validates :user_id, presence: true
	validates :level_id, presence: true
	validates :category_id, presence: true

	# Returns menu from the users being followed by the given user.
	def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
