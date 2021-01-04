class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.belongs_to :sub
      t.belongs_to :author

      t.timestamps
    end
  end
end