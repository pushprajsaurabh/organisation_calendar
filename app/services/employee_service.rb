class EmployeeService

  def initialize(employee_id)
    @employee_id =  employee_id
  end

  def add_employee(params)
    employee = Employee.create_update_employee(employee_id, params[:name], params[:email_id])
    return result(employee, { message: 'Employee added successfully!' }, :ok)
  end


  private
  attr_reader :employee_id

  def result(payload, meta, status = :ok)
    { payload: payload, meta: meta, status: status }
  end
end