class Article < ApplicationRecord

	belongs_to :user
	mount_uploader :image, ImageUploader
	acts_as_ordered_taggable_on :interests
	has_many :favorites, dependent: :destroy
	has_many :comments

	validates :title, presence: true, length: { minimum: 5 }

	def favorited_by? user
		favorites.where(user_id: user.id).exists?
	end

	acts_as_ordered_taggable_on :situations
end
