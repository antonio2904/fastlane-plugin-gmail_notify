require "fastlane_core/ui/ui"
require "erb"

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class GmailNotifyHelper
      # class methods that you define here become available in your action
      # as `Helper::GmailNotifyHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the gmail_notify plugin helper!")
      end
    end
  end
end
