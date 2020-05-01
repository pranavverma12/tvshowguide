class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name, null: false, index: true
      t.references :channel, null: false, foreign_key: true, index: true
      t.time :timing, null: false

      t.timestamps
    end
  end
end
