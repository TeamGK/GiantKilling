class Article < ApplicationRecord

	belongs_to :user
	mount_uploader :image, ImageUploader
	acts_as_ordered_taggable_on :interests
	has_many :favorites, dependent: :destroy

end
