class Post < ApplicationRecord
  mount_uploaders :image, ImageUploader
  belongs_to :topic
  
  validates :example, :memo, presence: true
  
  
  # 検索窓いらないかも
  # def self.search(search) #self.でクラスメソッドとしている
  #   if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
  #     Post.where(['example LIKE ? or memo LIKE ?', "%#{search}%"])
     
  #   # .where('カラム名 like ? or カラム名 like ?', '検索したい文字列1', '検索したい文字列2')

  #   else
  #     Post.all #全て表示。
  #   end
  # end    
end
