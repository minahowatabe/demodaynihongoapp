class RemoveColumnFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :provider, :string 
    remove_column :users, :uid, :string
    remove_column :users, :username, :string 
    remove_column :users, :image_url, :string 
  end
end
