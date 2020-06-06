class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, only: [:create]
  add_flash_types :info, :warning
end
