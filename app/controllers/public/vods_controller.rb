class Public::VodsController < Public::ApplicationController

  def search_vod
    if params[:vod].present?
      @posts=Post.where(status: true).joins(:vods).where(vods: {name: params[:vod]})
    else
      flash.now[:alert]="検索結果はありません"  
    end   
    @vods=Vod.limit(6)
    @tags=Tag.limit(6)

    if params[:latest]
      @posts=Post.latest.joins(:vods).where(vods: {name: params[:vod]})
    elsif params[:old]
      @posts=Post.old.joins(:vods).where(vods: {name: params[:vod]}) 
    elsif params[:star_count]
      @posts=Post.star_count.joins(:vods).where(vods: {name: params[:vod]})
    else
      @posts=Post.where(status: true).joins(:vods).where(vods: {name: params[:vod]})
    end      
  end

end
