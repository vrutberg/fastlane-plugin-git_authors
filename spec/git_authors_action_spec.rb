describe Fastlane::Actions::GitAuthorsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The git_authors plugin is working!")

      Fastlane::Actions::GitAuthorsAction.run(nil)
    end
  end
end
