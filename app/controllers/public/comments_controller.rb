class Public::CommentsController < Public::ApplicationController
  before_action :check_guest_user, only: [:create, :destroy]

  def create
    @post=Post.find(params[:post_id])
    @comment=current_user.comments.new(comment_params)
    @comment.post_id=@post.id
    @comment.save
  end  

  def destroy
    @post=Post.find(params[:post_id])
    @comment=current_user.comments.find(params[:id])
    @comment.destroy
  end   

  private
   def comment_params
    params.require(:comment).permit(:comment)
   end 

   def check_guest_user
    if current_user.guest_user?
      redirect_to request.referer, notice: "ゲストユーザーは閲覧のみ可能です"
    end
   end
end   