class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :tag_items, dependent: :destroy
  has_many :tags, through: :tag_items
  has_many :vod_items, dependent: :destroy
  has_many :vods, through: :vod_items
  has_many :notifications, as: :notifiable, dependent: :destroy
  validates :title, presence: true
  validates :impression, presence: true, length: {maximum: 50}

  has_one_attached :image

  def get_image(width, height)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [ width, height ]).processed
  end

  def self.search_for(word,condition)
    if condition=="partial"
      Post.where("title LIKE?", "%"+word+"%")
    elsif condition=="forward"
      Post.where("title LIKE?", word+"%")
    elsif condition=="backward"
      Post.where("title LIKE?","%"+word) 
    elsif condition=="perfect"
      Post.where(title: word)     
    end 
  end 

  def save_tags(tags)
    #postsに紐づくtag一覧を取得→current_tagsに代入
    current_tags=self.tags.pluck(:name) unless self.tags.nil?
    #タグ前の#を削除
    tags=tags.map { |tag| tag.sub(/^#/,'') }.reject(&:empty?)
    #current_tagsと受け取ったtagの差をpresence_tagsに代入(既に登録済だけど今回のタグにないもの)
    presence_tags=current_tags-tags  
    #受け取ったtagとcurrent_tagsの差をnew_tagに代入(新しいタグ)
    new_tags=tags-current_tags
    
    #既に登録済で更新されたタグに含まれないものをtag_itemから削除
    presence_tags.each do |tag|
     self.tags.delete Tag.find_by(name: tag)
    end 
    #更新されたタグで未登録のタグを新規登録
    new_tags.each do |tag|
      new_tag=Tag.find_or_create_by(name: tag)
      self.tags<<new_tag
    end   
  end 

  def save_vods(vods)
    #postsに紐づくtag一覧を取得→current_tagsに代入
    current_vods=self.vods unless self.vods.nil?
    #current_tagsと受け取ったtagの差をpresence_tagsに代入(既に登録済だけど今回のタグにないもの)
    presence_vods=current_vods-vods  
    #受け取ったtagとcurrent_tagsの差をnew_tagに代入(新しいタグ)
    new_vods=vods-current_vods
    #既に登録済で更新された配信サイトに含まれないものをvod_itemから削除
    presence_vods.each do |vod|
     self.vods.delete Vod.find_by(id: vod)
    end 
    #更新された配信サイトで未登録の配信サイトを新規登録
    new_vods.each do |vod|
      vods=Vod.find_by(id: vod)
      self.vods<< vods if vods.present?
    end   
  end 

  def post_status
    status==false
  end  

  scope :latest, ->{where(status: true).order(created_at: :desc)}
  scope :old, ->{where(status: true).order(created_at: :asc)}
  scope :star_count, ->{where(status: true).order(star: :desc)}
  scope :genre, ->{where(status: true).joins(:genre).order('genres.name')}

    
    
end

