class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :show, null: false, foreign_key: true, index: true

      t.timestamps
    end
      add_index :favourites, %i[user_id show_id], unique: true
  end
end
