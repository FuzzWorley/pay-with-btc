class AddAdminToStores < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :admin, foreign_key: true
  end
end
