class Public::SearchesController < Public::ApplicationController
  before_action :check_guest_user, only: [:search]

  def search
    @word=params[:word]
    @model=params[:model]
    condition=params[:condition]

    if @model=="User"
      @users=User.search_for(@word,condition)
    else @model=="Post"
      @posts=Post.search_for(@word,condition) 
    end     
  end     
  
  private
   def check_guest_user
    if current_user.guest_user?
      redirect_to posts_path, notice: "ゲストユーザーは閲覧のみ可能です"
    end
   end

end
