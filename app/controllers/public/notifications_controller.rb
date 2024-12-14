class Public::NotificationsController < Public::ApplicationController

  def update
    notification=current_user.notifications.find(params[:id])
    notification.update(read: true)
    case notification.notifiable_type
    when "Comment"
      redirect_to post_path(notification.notifiable.post)
    when "Post"
      redirect_to post_path(notification.notifiable)  
    end   
  end
end   
