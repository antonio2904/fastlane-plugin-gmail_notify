describe Fastlane::Actions::GmailNotifyAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The gmail_notify plugin is working!")

      Fastlane::Actions::GmailNotifyAction.run(nil)
    end
  end
end
