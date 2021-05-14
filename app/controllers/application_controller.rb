class ApplicationController < ActionController::Base
  # raises an "Exception" if there isn't sufficient protection
  protect_from_forgery with: :exception
end
