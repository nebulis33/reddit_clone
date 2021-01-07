class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :author
      t.references :post
      t.references :parent_comment, null: true

      t.timestamps
    end
  end
end
