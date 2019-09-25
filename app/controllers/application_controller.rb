class ApplicationController < ActionController::API
  include ActionController::Caching
  before_action :authenticate_user!
end
