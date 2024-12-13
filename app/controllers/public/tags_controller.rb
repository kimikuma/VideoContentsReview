class Public::TagsController < ApplicationController

  def search_tag
    if params[:tag].present?
      @posts=Post.where(status: true).joins(:tags).where(tags: {name: params[:tag]})
    else 
      flash[:notice]="検索結果はありません" 
    end  
    @tags=Tag.limit(6)
    @vods=Vod.limit(6)
  end   

  def index
    @vods=Vod.page(params[:page]).per(20)
    @tags=Tag.page(params[:page]).per(20)
  end  
  
end
