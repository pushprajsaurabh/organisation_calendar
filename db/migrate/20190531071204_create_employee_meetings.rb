class CreateEmployeeMeetings < ActiveRecord::Migration
  def up
    create_table :employee_meetings do |t|
      t.integer :employee_id, null: false, index: true
      t.integer :meeting_id, null: false, index: true
      t.datetime :invited_at_time, null: false
    end
    add_index :employee_meetings, [:employee_id, :meeting_id], unique: true
  end

  def down
    drop_table :employee_meetings
  end
end
