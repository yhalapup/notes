class AddSourceToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :source, :string, null: false, default: "notes_application"
  end
end
