class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :book
      t.references :user
      t.text :body
      t.timestamps
    end
  end
end
