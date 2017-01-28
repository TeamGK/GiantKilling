class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :sex, presence: true

end
