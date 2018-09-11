class Question < ApplicationRecord
 has_many :answers    
 has_many :keywords
 
 validates :title, :content, :keyword, presence: true
end
