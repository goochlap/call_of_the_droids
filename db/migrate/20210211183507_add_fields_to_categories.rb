class AddFieldsToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :string
    add_reference :categories, :droid, null: false, foreign_key: true
  end
end
