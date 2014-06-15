class Post < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 150 }
	validates :content, presence: true
	default_scope -> { order('created_at DESC') }
end
