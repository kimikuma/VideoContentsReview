class Public::PostsController < Public::ApplicationController
  before_action :check_sign_in_user, only: [ :edit, :update, :destroy ]
  before_action :check_guest_user, except: [ :index, :show ]
  before_action :post_status_and_user, only: [ :show ]

  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(post_params)
    tags=params[:post][:tag].split('#').reject(&:empty?)
    vods=params[:post][:vod_ids].reject(&:empty?)
    
    if @post.save
      @post.save_tags(tags)
      @post.save_vods(vods)
      flash[:notice]="投稿に成功しました!"
      redirect_to post_path(@post)
    else
      flash.now[:alert]="投稿に失敗しました"
      Rails.logger.debug @post.errors.full_messages
      render "new"
    end
  end

  def index
    if params[:latest]
      @posts=Post.latest.page(params[:page]).per(8)
    elsif params[:old]
      @posts=Post.old.page(params[:page]).per(8)
    elsif params[:star_count]
      @posts=Post.star_count.page(params[:page]).per(8)
    elsif params[:genre]  
      @posts=Post.genre.page(params[:page]).per(8)
    else      
      @posts=Post.where(status: true).order(created_at: :desc).page(params[:page]).per(8)
    end
    @tags=Tag.all
    @vods=Vod.all
  end   

  def show
    @post=Post.includes(:genre).find(params[:id])
    @comment=Comment.new
  end

  def edit
    @post=current_user.posts.find(params[:id])
  end

  def update
    @post=current_user.posts.find(params[:id])
    tags=params[:post][:tag].split('#').reject(&:empty?)
    vods=params[:post][:vod_ids].reject(&:empty?)
    if @post.update(post_params)
      @post.save_tags(tags)
      @post.save_vods(vods)
      flash[:notice]="更新に成功しました！"
      redirect_to post_path(@post)
    else
      flash.now[:alert]="更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    post=current_user.posts.find(params[:id])
    post.destroy
    redirect_to mypage_path
  end

  private
   def post_params
     params.require(:post).permit(:title, :impression, :image, :genre_id, :star, :status)
   end

   def check_sign_in_user
     post=Post.find(params[:id])
     unless post.user==current_user
       redirect_to posts_path
     end
   end

   def check_guest_user
    if current_user.guest_user?
      redirect_to posts_path, notice: "ゲストユーザーは閲覧のみ可能です"
    end
   end
  
   def post_status_and_user
    @post=Post.find(params[:id])
    if @post.post_status
     unless @post.user==current_user 
      redirect_to posts_path 
     end    
    end  
   end 
   
end
