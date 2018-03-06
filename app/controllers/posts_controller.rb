class PostsController < ApplicationController
	

	def index
		@post = Post.all
		render json: @post
	end

	def create
    	@post = Post.new(post_params)
 	    if @post.save
  			render json: {'success' =>1, 'message' => 'data berhasil disimpan'},status: :ok
  		else 
  			 render json: {'success' =>0, 'message' => 'data gagal disimpan'},status: :ok
  		end

	end
 
	private def post_params
    	params.permit(:user_id, :isi,:blokir,:lat,:lng)
 	end

end
