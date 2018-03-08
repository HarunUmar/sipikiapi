
class Posts::PostsController < ApplicationController

	def index
		@post = Post.offset(params[:offset]).limit(params[:limit]).order(created_at: :desc)
		render json: @post
	end

	def create
    	@post = Post.new(post_params)
 	    if @post.save
  			render json: {'success' =>1, 'message' => 'data berhasil disimpan'},status: :ok
  		else 
  			render json: {'success' =>0, 'message' => @post.errors.full_messages},status: :ok
  		end

	end

	def find
		@post = Post.find(params[:id])
		render json: {'success'=>0, 'message' => @post}
	
	end

	def search 
		if (params[:nama].length >= 3 )
		
			@post = Post.joins(:user).where('nama LIKE ?',"%#{params[:nama]}%")
			if @post.empty?
				render json: {'success'=>0, 'message' => 'data tidak ditemukan'}
			else
				render json: {'success'=> 1, 'message' => @post}
			end
		end
	end
 
	private def post_params
    	params.permit(:user_id, :isi,:blokir,:lat,:lng)
 	end
 end