class Project < ActiveRecord::Base
	has_many :emails, through: :users
	belongs_to :user
end