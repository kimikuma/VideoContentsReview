module Public::NotificationsHelper

  def notification_messages(notification)
    case notification.notifiable_type
    when "Comment"
      "投稿した[#{notification.notifiable.post.title}]に#{notification.notifiable.user.name}さんがコメントしました".html_safe
    when "Post"
      "投稿した[#{notification.notifiable.title}]を管理者が変更しました"
    end 
  end     
end
