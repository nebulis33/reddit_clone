class CreateSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description
      t.belongs_to :moderator

      t.timestamps
    end
    add_index :subs, :title, unique: true
  end
end
