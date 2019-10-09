# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= (User.all.first || User.create)
  end
end
