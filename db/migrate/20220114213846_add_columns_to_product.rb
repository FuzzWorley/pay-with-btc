class AddColumnsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :name, :string
    add_column :products, :featured, :boolean, null: false, default: false
    add_column :products, :live, :boolean, null: false, default: false
    add_column :products, :position, :integer
  end
end
