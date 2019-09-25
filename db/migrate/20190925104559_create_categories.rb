class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.string :state, null: false, default: 'active'
      t.references :vertical, foreign_key: true

      t.timestamps
    end
  end
end
