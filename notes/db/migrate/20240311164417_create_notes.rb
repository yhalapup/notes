class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.string :title, limit: 50, null: false
      t.text :content, limit: 10_000, null: false

      t.timestamps
    end
  end
end
