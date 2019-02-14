class CreateJoinTableCustomListPerson < ActiveRecord::Migration[5.2]
  def change
    create_join_table :custom_lists, :people do |t|
      # t.index [:custom_list_id, :person_id]
      # t.index [:person_id, :custom_list_id]
    end
  end
end
