class Public::GenresController < ApplicationController

  def search_genre
    if params[:genre].present?
      @posts=Post.joins(:genre).where(status: true).where(genres: {name: params[:genre]})
    else 
      flash[:alert]="検索結果はありませんでした"  
    end 
    
    if params[:latest]
      @posts=Post.latest.joins(:genre).where(genres: {name: params[:genre]})
    elsif params[:old]
      @posts=Post.old.joins(:genre).where(genres: {name: params[:genre]}) 
    elsif params[:star_count] 
      @posts=Post.star_count.joins(:genre).where(genres: {name: params[:genre]})  
    else
      @posts=Post.joins(:genre).where(status: true).where(genres: {name: params[:genre]})
    end 
  end       
end
