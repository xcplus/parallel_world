class AddStyleToCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :style, :string, comment: "配置类型"
    add_index :codes, :style
  end
end
