class Box < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
#	validates :date, presence: true 
	validates :user_id, presence: true 
end
