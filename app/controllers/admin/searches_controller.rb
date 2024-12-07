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
  
end
