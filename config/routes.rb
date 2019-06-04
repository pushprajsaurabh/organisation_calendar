Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  namespace :api do
    namespace :v1 do
      post 'employee/create' => 'employee#add_employee'
      post 'meeting/create' => 'meeting#create_invite'
      post 'meeting/invitee/add' => 'meeting#add_invitee'
      get 'meeting/rooms/status' =>'meeting_room#list_rooms_status'
    end
  end
end
