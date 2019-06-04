module Api::V1
  class MeetingRoomController < ApplicationController

   def list_rooms_status
      check_list_rooms_params
      result = MeetingRoomService.new(params).create_meeting
      render json: {
        payload: result[:payload],
        meta: result[:meta]
      }, status: result[:status]
    end

    private

    def check_list_rooms_params
      param! :start_time, Datetime, required: true, blank: false
      param! :end_time, Datetime, required: true, blank: false
    end

  end
end