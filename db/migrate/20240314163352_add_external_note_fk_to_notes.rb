class AddExternalNoteFkToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :external_note_fk, :string
    add_index :notes, :external_note_fk, unique: true
  end
end
