class MeetingRoomService

  def initialize(params)
    @params =  params
  end

  def list_rooms_status
    rooms_status = MeetingRoom.all.map do |room|
      {
        name: room.name,
        information: room.information,
        capacity: room.capacity,
        available: occupied_rooms.include?(room.id) ? false : true
      }
    end
    return result(rooms_status, { message: 'Meeting rooms status fetched successfully!' }, :ok)
  end

  private
  attr_reader :params

  def start_time
    params[:start_time]
  end

  def end_time
    params[:end_time]
  end

  def meeting_id
    params[:meeting_id]
  end

  def time_slot_meetings
    @time_slot_meetings ||= Meeting.where('start_time >= ? and end_time <= ?', Time.zone.parse(params[:start_time]), Time.zone.parse(params[:end_time]))
  end

  def occupied_rooms
    @occupied_rooms ||= time_slot_meetings.pluck(:meeting_room_id)
  end

  def result(payload, meta, status = :ok)
    { payload: payload, meta: meta, status: status }
  end
end