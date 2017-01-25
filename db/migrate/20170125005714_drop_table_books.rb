class DropTableBooks < ActiveRecord::Migration[5.0]
  def change
    drop_table :books do |t|
      t.string :title
      t.string :author
      t.date :published_on
      t.boolean :showing, default: false
      t.integer :price
      t.timestamps
    end
  end
end
