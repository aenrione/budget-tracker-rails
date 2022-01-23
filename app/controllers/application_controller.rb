class ApplicationController < ActionController::Base
  include PowerTypes::Presentable
  protect_from_forgery
end
