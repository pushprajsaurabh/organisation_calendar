class EmployeeMeeting < ActiveRecord::Base
  belongs_to :employee
  belongs_to :meeting
  has_many :meetings, through: :employee_meetings
  validates_uniqueness_of :employee_id, scope: [:meeting_id]

  def self.add_employee_meeting(meeting_id, employee_id)
    ActiveRecord::Base.transaction do
      employee_meeting = EmployeeMeeting.create!(
        employee_id: employee_id,
        meeting_id: meeting_id,
        invited_at_time: Time.zone.now
      )
      meeting = Meeting.find(meeting_id)
      meeting.increment!(:total_participants, 1)
    end
  end

  def self.delete_employee_meeting(meeting_id, employee_id)
    ActiveRecord::Base.transaction do
      EmployeeMeeting.where(employee_id: employee_id, meeting_id: meeting_id).first.delete
      meeting = Meeting.find(meeting_id)
      meeting.decrement!(:total_participants, 1)
    end
  end
end