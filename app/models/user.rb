class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  validates_uniqueness_of :name
  validates_presence_of :name    
  
  # remenber_meを有効にする
  def remember_me
    true
  end
  
end
