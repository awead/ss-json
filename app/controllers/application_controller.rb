# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  helper_method :current_user
  def current_user
    @current_user ||= (User.all.first || User.create)
  end
end
