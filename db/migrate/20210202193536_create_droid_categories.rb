class CreateDroidCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :droid_categories do |t|
      t.references :droid, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
