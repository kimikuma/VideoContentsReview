class Admin::GenresController < Admin::ApplicationController
  
  def index
    @genres=Genre.all
    @genre=Genre.new
  end 
  
end
