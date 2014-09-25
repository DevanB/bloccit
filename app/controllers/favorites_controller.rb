class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    if favorite.save
      flash[:notice] = "Success favoriting the post."
      redirect_to [@post.topic, @post]
    else
      flash[:danger] = "There was a problem favoriting this post. Please try again."
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by_post_id(params[:post_id])
    authorize favorite
    if favorite.destroy
      flash[:notice] = "Post unfavorited."
      redirect_to [@post.topic, @post]
    else
      flash[:danger] = "The post was not successfully unfavorited. Please try again."
      redirect_to @post
    end
  end
end
