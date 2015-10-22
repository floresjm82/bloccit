class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
=begin
the index on the references line tells the database to index the post_id
column, so it can be searched efficiently. This is always a good idea for foreign
keys, and is added automatically when you generate with the references argument.
=end
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
    #add_foreign_key :comments, :posts
  end
end
