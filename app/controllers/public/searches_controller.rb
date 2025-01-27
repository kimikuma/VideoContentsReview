class Public::SearchesController < Public::ApplicationController

  def search
    @word=params[:word]
    @model=params[:model]
    condition=params[:condition]

    if @model=="true"
      @users=User.search_for(@word,condition)
    else @model=="false"
      @posts=Post.search_for(@word,condition).where(status: true)
    end     
  end     

end
