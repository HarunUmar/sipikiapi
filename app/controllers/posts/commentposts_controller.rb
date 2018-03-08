
class Posts::CommentpostsController < ApplicationController


	def create
    	@comment = Commentpost.new(comment_params)
 	    if @comment.save
  			render json: {'success' =>1, 'message' => 'anda baru saja berkomentar'},status: :ok
  		else 
  			render json: {'success' =>0, 'message' => @comment.errors.full_messages},status: :ok
  		end

	end


 
	private def comment_params
    	params.permit(:user_id, :post_id,:isi)
 	end
 end