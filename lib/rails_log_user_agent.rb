require "rails_log_user_agent/version"

module RailsLogUserAgent
  # Your code goes here...
end

module Rails
  module Rack
    class Logger < ActiveSupport::LogSubscriber
      # Add UserAgent
      def started_request_message(request)
        'Started %s "%s" for %s at %s by %s' % [
          request.request_method,
          request.filtered_path,
          request.ip,
          Time.zone.now.to_default_s,
          request.user_agent
        ]
      end
    end
  end
end
