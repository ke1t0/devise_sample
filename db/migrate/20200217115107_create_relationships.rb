class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :follower_id

      t.index [:following_id, :follower_id], unique: true

      t.timestamps
    end
  end
end
