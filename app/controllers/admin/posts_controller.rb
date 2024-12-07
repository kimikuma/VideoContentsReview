class Admin::PostsController < Admin::ApplicationController

  def index
    @posts=Post.all 
  end
  
  def show
    @post=Post.find(params[:id])
  end 
  
  def edit 
    @post=Post.find(params[:id])
  end 
  
  def update 
    @post=Post.find(params[:id])
    if @post.update(post_params)
      @vod=params[:post][:vod_ids]
      VodItem.find_or_create_by(post_id: @post, vod_id: @vod)
      
      flash[:notice]="更新に成功しました!"
      redirect_to admin_post_path(@post)
    else 
      flash[:notice]="更新に失敗しました"
      render "edit"
    end 
  end   
    
  def destroy
    @post=Post.find(params[:id])
    if @post.destroy
      flash[:notice]="削除しました"
      redirect_to admin_posts_path
    else 
      flash[:notice]="削除失敗しました"
      redirect_to admin_post_path(@post)
    end 
  end     

  private
   def post_params
    params.require(:post).permit(:title, :impression, :image, :genre_id)
   end  
end
