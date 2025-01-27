class Admin::UsersController < Admin::ApplicationController
  def index
    @users=User.order(created_at: :desc).page(params[:page]).per(10)
  end 
  
  def show
    @user=User.find(params[:id])
    @posts=@user.posts.order(created_at: :desc).page(params[:page]).per(6)
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="更新に成功しました!"
      redirect_to admin_user_path(@user)
    else
      flash.now[:alert]="更新に失敗しました"
      render "edit"
    end 
  end 
  
  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      flash[:notice]="退会処理完了しました"
      redirect_to admin_users_path
    else
      flash.now[:alert]="退会処理失敗しました"
      redirect_to request.referer
    end 
  end 
  
  private
   def user_params
    params.require(:user).permit(:name, :email, :profile_image)
   end   

end
