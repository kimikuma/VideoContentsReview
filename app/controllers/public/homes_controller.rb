class Public::HomesController < Public::ApplicationController

  def top
    @posts=Post.where(status: true).order(created_at: :desc).limit(10)
    @posts_star=Post.where(status: true).order(star: :desc).limit(5)
  end
end
