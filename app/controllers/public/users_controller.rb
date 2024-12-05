class Public::UsersController < Public::ApplicationController
  before_action :check_guest_user, except: [ :show ]
  before_action :check_current_user,only: [ :edit ]
  
  def mypage
    @user=current_user
    @posts=@user.posts
  end

  def show
    @user=User.find(params[:id])
    @posts=@user.posts
  end

  def edit
    @user=current_user
  end

  def update
    @user=current_user
    if @user.update(user_params)
      flash[:notice]="更新に成功しました!"
      redirect_to mypage_path
    else
      flash[:notice]="更新に失敗しました!"
      render "edit"
    end
  end

  def confirm
  end

  def destroy
    @user=current_user
    if @user.destroy
      flash[:notice]="退会しました"
      redirect_to new_user_registration_path
    else 
      flash[:notice]="退会に失敗しました"
      redirect_to "confirm"
    end
  end

  private
   def user_params
     params.require(:user).permit(:name, :email, :profile_image)
   end

   def check_guest_user
     if current_user.guest_user?
      redirect_to posts_path, notice: "ゲストユーザーは閲覧のみ可能です"
     end
   end
  
   def check_current_user
    user=User.find(params[:id])
     unless user==current_user
      redirect_to mypage_path
     end
   end

end
