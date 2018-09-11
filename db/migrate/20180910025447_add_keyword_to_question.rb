class AddKeywordToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :keyword, :string 
  end
end
