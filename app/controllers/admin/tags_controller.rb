class Admin::TagsController < ApplicationController

  def create
    @tag=Tag.new(tag_params)
    if @tag.save
      flash[:notice]="登録に成功しました!"
      redirect_to admin_genres_path
    else 
      flash[:notice]="登録に失敗しました"
      render "new"
    end 
  end      

  def edit
    @tag=Tag.find(params[:id])
  end  
  
  def update 
    @tag=Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice]="更新に成功しました!"
      redirect_to admin_genres_path 
    else 
      flash[:notice]="更新に失敗しました"  
      render "edit"
    end
  end 
  
  def destroy
    @tag=Tag.find(params[:id])
    if @tag.destroy
      flash[:notice]="削除しました"
      redirect_to admin_genres_path
    else
      flash[:notice]="削除失敗しました"
      render "edit" 
    end 
  end 
  
  private
   def tag_params
    params.require(:tag).permit(:name)
   end 

end
