class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :name, null: false, index: true
      t.string :email_id, null: false, index: true
      t.string :employee_id, null: false, index: true
      t.timestamps
    end
  end


  def down
    drop_table :employees
  end

end
