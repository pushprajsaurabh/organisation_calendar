class ApplicationController < ActionController::API
  include Concerns::Errors
  include Concerns::ErrorHandlers
end
