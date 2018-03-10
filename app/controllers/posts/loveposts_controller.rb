
class Posts::LovepostsController < ApplicationController


	def create
    	@love = Lovepost.new(love_params)
 	    if @love.save
  			render json: {'success' =>1},status: :ok
  		else 
  			render json: {'success' =>0, 'message' => @comment.errors.full_messages},status: :ok
  		end

	end

	private def love_params
    	params.permit(:user_id, :post_id)
 	end
 end