class AddAudioUrlToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :audio_url, :string
  end
end
