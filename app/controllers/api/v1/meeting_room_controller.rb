module Api::V1
  class MeetingRoomController < ApplicationController

   def list_rooms_status
      check_list_rooms_params
      result = MeetingRoomService.new(params).list_rooms_status
      render json: {
        payload: result[:payload],
        meta: result[:meta]
      }, status: result[:status]
    end

    private

    def check_list_rooms_params
      param! :start_time, String, required: true, blank: false
      param! :end_time, String, required: true, blank: false
    end

  end
end