class Meeting < ActiveRecord::Base
  has_many :employee_meetings
  has_many :employees, through: :employee_meetings
  belongs_to :meeting_room

  def self.create_meeting(params)
    meeting = Meeting.create!(params)
    return meeting
  end

  def self.update_meeting(meeting_id, update_params)
    meeting = Meeting.find(meeting_id)
    meeting.update!(update_params)
    return meeting
  end
end