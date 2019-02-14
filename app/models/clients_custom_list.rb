class ClientsCustomList < ApplicationRecord
  belongs_to :custom_list
  belongs_to :client
end
