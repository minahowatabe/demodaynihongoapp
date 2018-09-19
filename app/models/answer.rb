class Answer < ApplicationRecord
  belongs_to :question
  
  validates :name, :body,  presence: true
  
  
end
