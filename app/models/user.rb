class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :articles
	has_many :favorites, dependent: :destroy
	has_many :relationships, foreign_key: :follower_id
	has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
	has_many :followers, through: :inverse_follows

	def followed_by? user
		inverse_follows.where(follower_id: user.id).exists?
	end

	enum sex: { "男"=>0, "女"=>1 }

	def self.ransackable_attributes auth_object = nil
		%w(sex age)
	end

	def self.ransackable_association auth_object = nil
		%w(sex age)
	end

end
