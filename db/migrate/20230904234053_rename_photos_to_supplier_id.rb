class RenamePhotosToSupplierId < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image, :supplier_id
  end
end
