module Public::PostsHelper
  def display_vod_items(vod_items)
    vod_items.map { |item| item.vod.name }.join(',')
  end
end
