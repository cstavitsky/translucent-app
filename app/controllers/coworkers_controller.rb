class CoworkersController < ApplicationController
	before_filter :authorize

	def new
		@coworker = Coworker.new
	end

	def create
		@coworker = Coworker.new(coworker_params)
		current_user.coworkers << @coworker
		if @coworker.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
	end

	private
	def coworker_params
    	params.require(:coworker).permit(:first_name, :email)
  	end
end