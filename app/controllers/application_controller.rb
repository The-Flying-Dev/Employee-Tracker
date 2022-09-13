class ApplicationController < ActionController::Base
  require 'csv'
  include Pagy::Backend
  protect_from_forgery with: :exception
end
