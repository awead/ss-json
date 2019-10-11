# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  private
    def psu_oauth_client
      @psu_oauth_client ||= OAuth2::Client.new(
        ENV.fetch("OAUTH_APP_ID"),
        ENV.fetch("OAUTH_APP_SECRET"),
        site: ENV.fetch("OAUTH_APP_URL")
      )
      puts @psu_oauth_client
    end

    def psu_access_token
      @psu_access_token ||=
      if current_user
        OAuth2::AccessToken.new(
          psu_oauth_client, current_user.psu_access_token
        )
      end
    end
end
