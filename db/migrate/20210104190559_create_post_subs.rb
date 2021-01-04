class CreatePostSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_subs do |t|
      t.belongs_to :post
      t.belongs_to :sub

      t.timestamps
    end
  end
end
