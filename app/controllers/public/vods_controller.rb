class Public::VodsController < ApplicationController

  def search_vod 
    @vods=Vod.all 
    @tags=Tag.all
    @vod=Vod.find(params[:id])
    @posts=@vod.posts
  end  
end
