class Public::PostsController < ApplicationController

  def new
    @post=Post.new
  end
  
  def create
    post=current_user.posts.new(post_params)
    if post.save
      flash[:notice]="投稿に成功しました!"
      redirect_to post_path(post)
    else
      flash[:notice]="投稿に失敗しました"
      render "new"
    end
  end

  def index
    @posts=Post.order(created_at: :desc).page(params[:page]).per(8)
  end

  def edit
    @post=current_user.posts.find(params[:id])
  end

  def update
    post=current_user.posts.find(params[:id])
    if post.update(post_params)
      flash[:notice]="更新に成功しました！"
    else
      flash[:notice]="更新に失敗しました！"
      render "edit"
    end
  end

  def destroy
    post=current_user.posts.find(params[:id])
    post.destroy
  end

  private
   def post_params
     params.require(:post).permit(:title, :impression, :tag, :star, :status, :profile_image)
   end
end
