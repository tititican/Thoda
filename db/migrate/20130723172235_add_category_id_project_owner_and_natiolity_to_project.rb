class AddCategoryIdProjectOwnerAndNatiolityToProject < ActiveRecord::Migration
  def change
    add_column :projects, :category_id, :integer
    add_column :projects, :owner, :string
    add_column :projects, :nationality, :string
  end
end
