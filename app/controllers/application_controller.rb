class ApplicationController < ActionController::Base
  before_action :set_tags

  private
   def set_tags
    @vods=Vod.page(params[:page]).per(20)
    @tags=Tag.limit(10)
   end  
end
