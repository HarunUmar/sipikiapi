class Checkpoints::CheckpointsController < ApplicationController

	def index
		@point = User.group(:id)
		render json: @point , adduser: true
	end

end
