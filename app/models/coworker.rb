class Coworker < ActiveRecord::Base
	has_many :emails, foreign_key: :recipient_id
	belongs_to :user
end