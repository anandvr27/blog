class AddOwnerIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :owner_id, :integer
  end
end
