module Api::V1
  class MeetingController < ApplicationController

   def create_invite
      check_invite_params
      result = MeetingsService.new(params).create_meeting
      render json: {
        payload: result[:payload],
        meta: result[:meta]
      }, status: result[:status]
    end

    def add_invitee
      check_add_invite_params
      result = MeetingsService.new(params).add_invitee_to_meeting
      render json: {
        payload: result[:payload],
        meta: result[:meta]
      }, status: result[:status]
    end

    private

    def check_invite_params
      param! :host_id, Integer, required: true, blank: false
      param! :title, String, required: true, blank: false
      param! :start_time, String, required: true, blank: false
      param! :end_time, String, required: true, blank: false
      param! :description, String, required: false
    end

    def check_add_invite_params
      param! :meeting_id, Integer, required: true, blank: false
      param! :invitee_id, Integer, required: true, blank: false
    end
  end
end