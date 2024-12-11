module Public::PostsHelper
  def display_vod_items_link(vod_items)
    vod_items.map { |item| link_to(item.vod.name, search_vod_path(vod: item.vod.name)) }.join(',').html_safe
  end

  def display_tag_items_link(tag_items)
    tag_items.map { |item| link_to("##{item.tag.name}", search_tag_path(tag: item.tag.name)) }.join('').html_safe
  end 

  def display_tag_items(tag_items)
    tag_items.map { |item| "##{item.tag.name}" }.join('')
  end 

end
