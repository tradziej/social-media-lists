class CreateFederalLegislators < ActiveRecord::Migration[5.2]
  def change
    create_table :federal_legislators do |t|
      t.string :first_name
      t.string :last_name
      t.string :facebook_id
      t.string :twitter_username

      t.timestamps
    end
  end
end
