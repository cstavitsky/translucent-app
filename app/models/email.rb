class Email < ActiveRecord::Base
	belongs_to :recipient, class_name: "Coworker"
	belongs_to :sender, class_name: "User"
end