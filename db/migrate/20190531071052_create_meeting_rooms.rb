class CreateMeetingRooms < ActiveRecord::Migration
  def up
    create_table :meeting_rooms do |t|
      t.string :name, null: false
      t.text :information
      t.integer :capacity, default: 10, index: true
    end
    add_index :meeting_rooms, :name, unique: true
  end


  def down
    drop_table :meeting_rooms
  end

end
