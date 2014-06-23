class PostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def index
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created!"
			redirect_to root_url
		else
			render 'static_pages/home'
	end

	def destroy
	end

end