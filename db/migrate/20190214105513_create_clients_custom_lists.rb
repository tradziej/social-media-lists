class CreateClientsCustomLists < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_custom_lists do |t|
      t.integer :custom_list_id
      t.integer :client_id
      t.boolean :active, default: true, null: false

      t.timestamps
    end
    add_index :clients_custom_lists, :custom_list_id
    add_index :clients_custom_lists, :client_id
    add_index :clients_custom_lists, [:custom_list_id, :client_id], unique: true
  end
end
