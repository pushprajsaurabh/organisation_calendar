class MeetingsService

  def initialize(params)
    @params =  params
  end

  def create_meeting
    meeting_params = {
      title: params[:title],
      description: params[:description],
      start_time: Time.zone.parse(params[:start_time]),
      end_time: Time.zone.parse(params[:end_time]),
      duration_minutes: (Time.zone.parse(params[:end_time] - Time.zone.parse(params[:start_time]).to_i / 60,
      host_id: params[:host_id]
      meeting_room_id: free_meeting_room.first.id
    }
    meeting = Meeting.create_update_meeting(meeting_params)
    EmployeeMeeting.add_employee_meeting(meeting.id, params[:host_id])
    return result(meeting.reload, { message: 'Meeting created successfully by the host!' }, :ok)
  end

  def add_invitee_to_meeting
    EmployeeMeeting.add_employee_meeting(meeting_id, invitee_id)
    return result({ }, { message: 'Invitee added successfully to the meeting!' }, :ok)
  end


  private
  attr_reader :params

  def meeting_id
    params[:meeting_id]
  end

  def invitee_id
    params[:invitee_id]
  end

  def time_slot_meetings
    @time_slot_meeting ||= Meeting.where('start_time <= ? and end_time >= ?', params[:start_time], params[:end_time])
  end

  def free_meeting_room
    occupied_rooms = time_slot_meeting.pluck(:meeting_room_id)
    @available_room ||= MeetingRoom.where.not(id: occupied_rooms).first
    return @available_room
  end

  def result(payload, meta, status = :ok)
    { payload: payload, meta: meta, status: status }
  end
end