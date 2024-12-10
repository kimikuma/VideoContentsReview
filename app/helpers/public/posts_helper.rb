module Public::PostsHelper
  def display_vod_items(vod_items)
    vod_items.map { |item| link_to(item.vod.name, search_vod_path(vod: item.vod.name)) }.join(',').html_safe
  end

  def display_tag_items(tag_items)
    tag_items.map { |item| link_to("##{item.tag.name}", search_tag_path(tag: item.tag.name)) }.join('').html_safe
  end 
end
