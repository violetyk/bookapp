class CreateFunComments < ActiveRecord::Migration
  def change
    create_table :fun_comments do |t|
      t.integer :author_no
      t.text :body
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
