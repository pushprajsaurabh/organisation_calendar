class CreateMeetings < ActiveRecord::Migration
  def up
    create_table :meetings do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :start_time, null: false, index: true
      t.datetime :end_time, null: false, index: true
      t.integer :duration_minutes, null: false
      t.integer :total_participants, null: false, default: 0
      t.integer :host_id, null: false, index: true
      t.integer :meeting_room_id, null: false, index: true
    end
  end


  def down
    drop_table :meetings
  end
end
