class AddColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :variable_pricing, :boolean, null: false, default: false
    add_column :products, :description, :text
    change_column_null :products, :amount, true
  end
end
