module Admin::PostsHelper

  def display_tag_items_edit(tag_items)
    tag_items.map { |item| link_to("##{item.tag.name}", edit_admin_tag_path(item.tag.id)) }.join('').html_safe
  end 
  
  def display_vod_items_edit(vod_items)
    vod_items.map { |item| link_to(item.vod.name, edit_admin_vod_path(item.vod.id)) }.join(',').html_safe
  end   
end
