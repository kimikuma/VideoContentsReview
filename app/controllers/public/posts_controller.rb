class Public::PostsController < Public::ApplicationController
  before_action :check_sign_in_user, only: [ :edit, :update, :destroy ]
  before_action :check_guest_user, except: [ :index, :show ]


  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(post_params)
    # if params[:post][:tags].present?
    #   tag=params[:post][:tags].split(',').map(&:strip)
    #   tags.each do |tag_name|
    #     tag=Tag.find_or_create_by(name: tag_name)
    #     @post.tags<< tag unless @post.tags.include?(tag)
    #   end
    # end

    if @post.save
      if params[:post][:vod_ids]
        @vod=params[:post][:vod_ids]
        # params[:post][:vod_ids].each do |vod_id|
        VodItem.find_or_create_by(post_id: @post.id, vod_id: @vod)
      #end
      end
      flash[:notice]="投稿に成功しました!"
      redirect_to post_path(@post)
    else
      flash.now[:alert]="投稿に失敗しました"
      Rails.logger.debug @post.errors.full_messages
      render "new"
    end
  end

  def index
    @posts=Post.includes(:vod_items).order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @post=Post.includes(:genre).find(params[:id])
  end

  def edit
    @post=current_user.posts.find(params[:id])
  end

  def update
    @post=current_user.posts.find(params[:id])
    # if params[:post][:tags].present?
    #   tag=params[:post][:tags].split(',').map(&:strip)
    #   tags.each do |tag_name|
    #     tag=Tag.find_or_create_by(name: tag_name)
    #     @post.tags<< tag unless @post.tags.include?(tag)
    #   end
    # end
    if @post.update(post_params)
      if params[:post][:vod_ids]
        @vod=params[:post][:vod_ids]
        # params[:post][:vod_ids].each do |vod_id|
        VodItem.find_or_create_by(post_id: @post.id, vod_id: @vod)
      #end
      end
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
     params.require(:post).permit(:title, :impression, :image, :genre_id)
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
end
