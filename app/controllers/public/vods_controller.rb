class Public::VodsController < ApplicationController

  def search_vod
    if params[:vod].present?
      @posts=Post.where(status: true).joins(:vods).where(vods: {name: params[:vod]})
    else
      flash[:notice]="検索結果はありません"  
    end   
    @vods=Vod.limit(6)
    @tags=Tag.limit(6)
  end  
end
