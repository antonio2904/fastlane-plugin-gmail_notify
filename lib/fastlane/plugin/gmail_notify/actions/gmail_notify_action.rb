require "fastlane/action"
require "fastlane_core/configuration/config_item"
require_relative "../helper/gmail_notify_helper"

module Fastlane
  module Actions
    class GmailNotifyAction < Action
      def self.run(params)
        UI.message("The gmail_notify plugin is working!")

        require 'pony'
        require 'erb'

        body = ERB.new(File.read(params[:template_file]), trim_mode: nil).result_with_hash(params[:placeholders])

        Pony.mail({
          to: params[:recipients],
          cc: params[:cc],
          subject: params[:subject],
          html_body: body,
          body_part_header: { content_disposition: "inline" },
          via: :smtp,
          via_options: {
            address: "smtp.gmail.com",
            port: "587",
            enable_starttls_auto: true,
            user_name: params[:sender_email],
            password: params[:sender_password],
            authentication: :plain, # :plain, :login, :cram_md5, no auth by default
            domain: "localhost.localdomain" # the HELO domain provided by the client to the server
          }
        })
      end

      def self.test(params)
        UI.message("The gmail_notify plugin is working!")

        body = ERB.new(File.read(params[:template_file]), trim_mode: nil).result_with_hash(params[:placeholders])

        puts(body)
      end

      def self.description
        "Sends a mail using SMTP"
      end

      def self.authors
        ["Antony Leons"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "This plugin sends a mail using SMTP"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :sender_email,
                                       env_name: "GMAIL_NOTIFY_SENDER_EMAIL",
                                       description: "Gmail account to login with",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :sender_password,
                                       env_name: "GMAIL_NOTIFY_SENDER_PASSWORD",
                                       description: "Password of Gmail account to login with",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :recipients,
                                       env_name: "GMAIL_NOTIFY_RECIPIENTS",
                                       description: "Recipients of email",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :cc,
                                       env_name: "GMAIL_NOTIFY_CC",
                                       description: "CC of email",
                                       optional: true,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :subject,
                                       env_name: "GMAIL_NOTIFY_SUBJECT",
                                       description: "Subject of email",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :template_file,
                                       env_name: "GMAIL_NOTIFY_TEMPLATE_FILE",
                                       description: "Path of template file",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :placeholders,
                                       env_name: "GMAIL_NOTIFY_TEMPLATE_PLACEHOLDERS",
                                       description: "Placeholders for email template",
                                       optional: false,
                                       type: Hash)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
