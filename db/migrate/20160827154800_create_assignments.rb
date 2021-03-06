class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :book, null: false
      t.string :title
      t.integer :page
      t.integer :per_day
      t.integer :days_per_week
      t.integer :played, default: 0
      t.text :notes
      t.belongs_to :lesson
      t.timestamps
    end
  end
end
