class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name, comment: "中文名称"
      t.string :english_name, comment: "英文名称"
      t.integer :status, default: 0, comment: "状态 0 可见 1 不可见"

      t.timestamps
    end
  end
end
