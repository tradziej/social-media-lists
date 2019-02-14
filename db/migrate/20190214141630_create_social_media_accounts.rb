class CreateSocialMediaAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media_accounts do |t|
      t.string :kind
      t.string :username
      t.integer :person_id

      t.timestamps
    end
  end
end
