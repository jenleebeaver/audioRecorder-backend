class RemoveMelodyFromRecordings < ActiveRecord::Migration[6.0]
  def change
    remove_column :recordings, :melody, :string
  end
end
