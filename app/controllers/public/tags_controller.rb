class Public::TagsController < ApplicationController

  def search_tag
    if params[:tag].present?
      @posts=Post.where(status: true).joins(:tags).where(tags: {name: params[:tag]})
    else 
      flash.now[:alert]="検索結果はありません" 
    end  
    @tags=Tag.limit(6)
    @vods=Vod.limit(6)

    if params[:latest]
      @posts=Post.latest.joins(:tags).where(tags: {name: params[:tag]})
    elsif params[:old]
      @posts=Post.old.joins(:tags).where(tags: {name: params[:tag]})
    elsif params[:star_count]
      @posts=Post.star_count.joins(:tags).where(tags: {name: params[:tag]})
    else
      @posts=Post.where(status: true).joins(:tags).where(tags: {name: params[:tag]})
    end        
  end   

  # def index
  #   @vods=Vod.page(params[:page]).per(20)
  #   @tags=Tag.limit(10)
  # end  
  
end
