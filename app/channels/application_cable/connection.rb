module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user


    def connect
      self.current_user = find_verified_user
    end

    private
    def find_verified_user
      # Devise's `warden` proxy is used here to get the user
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end



  end
end
