class Checkpoints::CheckpointsController < ApplicationController



	def index
		@point = Post.select(:user_id,:isi,:lat,:lng).distinct.pluck(:isi)
		render json: @point
	end


	

end
