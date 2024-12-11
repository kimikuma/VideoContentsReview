class Admin::SearchesController < Admin::ApplicationController

  def search
    @word=params[:word]
    @model=params[:model]
    condition=params[:condition]
  
    if @model=="User"
      @users=User.search_for(@word,condition)
    else 
      @posts=Post.search_for(@word,condition)
    end 
  end     

  def search_tag_genre_vod
    @word=params[:word]
    @model=params[:model]

    if @model=="tag"
      @tags=Tag.where("name LIKE?", "%" + @word + "%")
    elsif @model=="genre"  
      @genres=Genre.where("name LIKE?", "%" + @word + "%")
    elsif @model=="vod"  
      @vods=Vod.where("name LIKE?", "%" + @word + "%") 
    end 
  end      
end
