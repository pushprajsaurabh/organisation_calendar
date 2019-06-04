module Api::V1
  class EmployeeController < ApplicationController

    def add_employee
      check_employee_params
      result = EmployeeService.new(params[:employee_id]).add_employee(params)
      render json: {
        payload: result[:payload],
        meta: result[:meta]
      }, status: result[:status]
    end

    private

    def check_employee_params
      param! :employee_id, Integer, required: true, blank: false
      param! :name, String, required: true, blank: false
      param! :email_id, String, required: true, blank: false
    end

  end
end