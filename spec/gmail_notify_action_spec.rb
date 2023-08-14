describe Fastlane::Actions::GmailNotifyAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The gmail_notify plugin is working!")

      hash = {
        subject: "Test",
        smtp_email: "",
        smtp_password: "",
        template_file: "./template.html",
        recipients: "",
        placeholders: {
          var1: "world"
        }
      }

      Fastlane::Actions::GmailNotifyAction.test(hash)
    end
  end
end
