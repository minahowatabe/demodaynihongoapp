class Question < ApplicationRecord
 has_many :answers, dependent: :destroy    
 has_many :keywords, dependent: :destroy
 
 validates :title, :content, presence: true
 default_scope -> { order(created_at: :desc) }
end
