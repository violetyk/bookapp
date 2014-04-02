class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.integer :price
      t.boolean :publish
      t.datetime :published_at
      t.timestamps
    end
  end
end
