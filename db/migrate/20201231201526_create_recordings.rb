class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.string :title
      t.string :melody
      t.integer :user_id

      t.timestamps
    end
  end
end
