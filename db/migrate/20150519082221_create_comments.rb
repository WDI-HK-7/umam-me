class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :dish, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
