class RenameColumnToSighting < ActiveRecord::Migration[7.0]
  def change
    rename_column :sightings, :longitutde, :longitude
  end
end
