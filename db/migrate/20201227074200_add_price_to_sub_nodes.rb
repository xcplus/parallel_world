class AddPriceToSubNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :sub_nodes, :price, :float, default: 0.0, comment: "车分系起步价"
  end
end
