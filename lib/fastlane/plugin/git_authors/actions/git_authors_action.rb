module Fastlane
  module Actions
    class GitAuthorsAction < Action
      def self.run(params)
        prefix = params[:prefix] == nil ? "Made with ❤️  by" : params[:prefix]
        suffix = params[:suffix] == nil ? "" : params[:suffix]

        output = Actions.sh("git log --format='%aN' | sort | uniq")

        UI.message([prefix, output.split("\n").join(", "), suffix].join(" "))
      end

      def self.description
        "List all authors of a Git repository"
      end

      def self.authors
        ["Viktor Rutberg"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "This plugin gives you a list of all authors of a Git repository"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :prefix,
                                  env_name: "GIT_AUTHORS_PREFIX",
                               description: "A prefix for the list of authors",
                                  optional: true,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :suffix,
                                  env_name: "GIT_AUTHORS_SUFFIX",
                               description: "A suffix for the list of authors",
                                  optional: true,
                                      type: String)
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
