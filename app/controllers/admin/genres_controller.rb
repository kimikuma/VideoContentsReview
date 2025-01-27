class Admin::GenresController < Admin::ApplicationController
  
  def index
    @genres=Genre.all
    @genre=Genre.new
    @vods=Vod.all 
    @vod=Vod.new
    @tags=Tag.all
    @tag=Tag.new
  end 

  def create
    @genre=Genre.new(genre_params)
    if @genre.save
      flash[:notice]="登録完了しました!"
      redirect_to admin_genres_path
    else
      flash.now[:alert]="登録失敗しました"
      redirect_to request.referer
    end 
  end       

  def edit
    @genre=Genre.find(params[:id])
  end   
  
  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice]="更新に成功しました!"
      redirect_to  admin_genres_path
    else 
      flash.now[:alert]="更新に失敗しました"
      render "edit" 
    end 
  end     

  def destroy
    @genre=Genre.find(params[:id])
    if @genre.destroy
      flash[:notice]="削除しました"
      redirect_to  admin_genres_path 
    else 
      flash.now[:alert]="削除に失敗しました"
      redirect_to  admin_genres_path
    end 
  end 

  private 
   def genre_params
    params.require(:genre).permit(:name)
   end  
end
