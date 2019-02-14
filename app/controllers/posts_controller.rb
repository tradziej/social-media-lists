class PostsController < ApplicationController
  def index
    @posts = Post.all.limit(100)
  end
end
