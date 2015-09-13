class BossMailer < ApplicationMailer
	default from: "translucentapp@gmail.com"

	def beginning_week_email(email, major_projects, user)
		@email = email
		@major_projects = major_projects
		@user = user
		mail(to: @email.addressee_email, subject: @email.subject_line_beginning_week, 
			:cc => current_user.email) 
	end
end
