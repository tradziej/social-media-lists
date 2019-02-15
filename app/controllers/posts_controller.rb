class PostsController < ApplicationController
  def index
    @posts = query
  end

 private
  def query
    params[:page] ||= 1
    params[:from] = Date.civil(
      params[:from_date][:year].to_i,
      params[:from_date][:month].to_i,
      params[:from_date][:day].to_i
    ) if params[:from_date].present?
    params[:to] = Date.civil(
      params[:to_date][:year].to_i,
      params[:to_date][:month].to_i,
      params[:to_date][:day].to_i
    ) if params[:to_date].present?

    query = PostQuery.new(Post.all).narrow(filters)

    query.relation.page(params[:page])
  end

  def filters
    params.permit(:from, :to, social_accounts: [], custom_lists: [])
  end
end
