class Menu < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 50 }
	validates :ingredient, presence: true, length: { maximum: 10000 }
	validates :description, presence: true, length: { maximum: 10000 }
	validates :user_id, presence: true
end
