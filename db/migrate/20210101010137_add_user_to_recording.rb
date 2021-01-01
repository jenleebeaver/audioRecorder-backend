class AddUserToRecording < ActiveRecord::Migration[6.0]
  def change
    add_reference :recordings, :user, foreign_key: true
  end
end
