require 'octokit'

module Lita
  module Handlers
    class ReviewerLotto < Handler
      def self.default_config(handler_config)
        handler_config.gh_token         = nil
        handler_config.gh_organization  = nil
        handler_config.gh_reviewer_team = nil
      end

      route /^reviewer for ([\w-]+) (\d+)$/, :reviewer_for, command: true,
        help: {"Lita: reviewer for [repo] [pull_request_number]" => "assigns a random reviewer for the pull request"}
      def reviewer_for(response)
        repository_name     = response.matches[0][0]
        pull_request_number = response.matches[0][1]

        repository = "#{config.gh_organization}/#{repository_name}"
        client = Octokit::Client.new(access_token: config.gh_token)
        reviewers = client.team_members(config.gh_reviewer_team).map(&:login)
        pull_request = client.pull_request(repository, pull_request_number)

        reviewer = (reviewers - [pull_request.user.login]).sample
        client.update_issue(repository, pull_request_number, pull_request.title, pull_request.body, assignee: reviewer)
        client.add_comment(repository, pull_request_number, "@#{reviewer} please review this :bow:")
        response.reply "#{reviewer} has been assigned for #{pull_request.html_url} as a reviewer"
      rescue Octokit::NotFound => e
        response.reply 'PullRequest not found'
      end

      private
      def config
        Lita.config.handlers.reviewer_lotto
      end
    end
    Lita.register_handler(ReviewerLotto)
  end
end