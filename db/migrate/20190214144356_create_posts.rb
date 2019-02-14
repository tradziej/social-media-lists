class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.datetime :posted_at
      t.text :content
      t.string :url
      t.integer :person_id
      t.integer :social_media_account_id

      t.timestamps
    end
  end
end
