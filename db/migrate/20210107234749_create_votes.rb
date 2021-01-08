class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user
      t.integer :value, null: false
      t.references :voteable, polymorphic:true

      t.timestamps
    end
    add_index :votes, [:user_id, :voteable_type, :voteable_id], unique: true
  end
end
