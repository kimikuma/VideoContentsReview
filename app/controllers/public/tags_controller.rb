class Public::TagsController < ApplicationController

  def search_tag
    @tags=Tag.all 
    @vods=Vod.all
    @tag=Tag.find(params[:id])
    @posts=@tag.posts
  end   
end
