class PostsController < ApplicationController
  def new
  end

  def show
   @posts = Post.find(:all) 
   
  end
end
