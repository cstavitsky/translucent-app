class User < ActiveRecord::Base
	has_many :emails, foreign_key: :sender_id
	has_many :coworkers
	has_many :projects
	has_secure_password


end