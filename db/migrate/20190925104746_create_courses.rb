class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, unique: true
      t.string :author, null: false
      t.string :state, null: false, default: 'active', index: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
