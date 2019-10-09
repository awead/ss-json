module OmniAuth
    module Strategies
      class Psu < OmniAuth::Strategies::OAuth2
        option :name, :psu
  
        option :client_options,
               site: ENV["OAUTH_APP_URL"],
               authorize_path: "/oauth/authorize"
  
        uid do
          raw_info["id"]
        end
  
        info do
          {
            email: raw_info["email"],
            name: raw_info["first_name"] + ' ' + raw_info["last_name"],
            access_id: raw_info["access_id"]
          }
        end
  
        def raw_info
          @raw_info ||= access_token.get("/user.json").parsed
        end
      end
    end
  end
  