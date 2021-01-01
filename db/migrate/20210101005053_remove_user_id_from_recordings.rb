class RemoveUserIdFromRecordings < ActiveRecord::Migration[6.0]
  def change
    remove_column :recordings, :user_id, :integer
  end
end
