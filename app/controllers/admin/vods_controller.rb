class Admin::VodsController < ApplicationController
  
  def create
    @vod=Vod.new(vod_params)
    if @vod.save
     flash[:notice]="登録に成功しました!"
     redirect_to admin_genres_path
    else 
      flash[:notice]="登録に失敗しました"
      redirect_to request.referer
    end 
  end 

  def edit 
    @vod=Vod.find(params[:id])
  end   
  
  def update 
    @vod=Vod.find(params[:id])
    if @vod.update(vod_params)
      flash[:notice]="更新に成功しました！"
      redirect_to admin_genres_path
    else
      flash[:notice]="更新に失敗しました"
      render "edit"
    end 
  end 
  
  def destroy
    @vod=Vod.find(params[:id])
    if @vod.destroy
      flash[:notice]="削除しました"
      redirect_to admin_genres_path
    else 
      flash[:notice]="削除に失敗しました"  
      redirect_to admin_genres_path
    end 
  end     

  private
   def vod_params
    params.require(:vod).permit(:name)
   end   
end

  
