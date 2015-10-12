class BossMailer < ApplicationMailer
	default from: "translucentapp@gmail.com"

	def beginning_week_email(email, major_projects, open_projects, user)
		@email = email
		@major_projects = major_projects
		@open_projects = open_projects
		@user = user
		mail(to: @email.addressee_email, subject: @email.subject_line_beginning_week, 
			:cc => @user.email) 
	end

	def end_week_email
	end
end
