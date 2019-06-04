class Employee < ActiveRecord::Base
  has_many :employee_meetings
  has_many :meetings, through: :employee_meetings

  def self.create_update_employee(employee_id, name, email_id)
    employee = Employee.where(employee_id: employee_id).first_or_initialize
    employee.update!(
      email_id: email_id,
      name: name
    )
    return employee
  end
end