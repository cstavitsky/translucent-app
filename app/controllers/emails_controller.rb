class EmailsController < ApplicationController

	before_filter :authorize

	def index
		@emails = Email.all
		@coworker = Coworker.first
	end

	def new
		#commented out stuff until I add sessions
		# @user = current_user
		@email = Email.new
		@user = User.find(current_user)
		# @projects = @user.projects.where(completed: false)
		@projects = Project.where(completed: false)
	end

	def create
		p params
		@email = Email.new(email_params)
		@recipient = Coworker.find_by(email: @email.addressee_email)
		@email.recipient_id = @recipient.id if @recipient
		@email.sender_id = current_user.id
		@user = User.find(@email.sender_id)
		@major_projects = @email.major_projects.split(",").map{|project| project.strip}
		@open_projects = @email.open_projects.split(",").map{|project| project.strip}
		if @email.save
			BossMailer.beginning_week_email(@email, @major_projects, @open_projects, @user).deliver_now
			redirect_to :action => :index
		else
			render 'new'
		end
	end

	private
	def email_params
    	params.require(:email).permit(:addressee_name, :addressee_email, :subject_line_beginning_week, :sender_id, :recipient_id, :major_projects, :open_projects)
  	end
end