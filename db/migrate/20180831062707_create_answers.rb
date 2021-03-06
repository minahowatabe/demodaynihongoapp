class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.string :name
      t.text :body
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
