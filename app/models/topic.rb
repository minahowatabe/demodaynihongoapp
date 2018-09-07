class Topic < ApplicationRecord
  has_many :post
  def self.search(search) #self.でクラスメソッドとしている
   if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Topic.where(['title LIKE ?', "%#{search}%"])
   else
      Topic.all #全て表示。
   end
  end    
end
