module Youtrack
  module Resources
    class Issues < Base
      PATHS = OpenStruct.new(
        issue: '/issues/%{id}',
        issues: '/issues',
        commands: '/commands',
      )

      def by_id(id)
        get_resource_with_fields(model.all_fields, PATHS.issue % { id: id })
      end

      def search(query, options = {})
        issues = get_resource_with_fields(model.minimal_fields, PATHS.issues, { params: { query: query }.merge(options) })
        return issues if issues.is_a?(Array)
        [issues]
      end

      def delete(id)
        delete_resource(PATHS.issue % { id: id })
      end

      # @param issue either a hash, json string or Issue instance
      def create(issue)
        post_resource_with_fields(model.all_fields, PATHS.issues, issue)
      end

      # @param issues either a list of ids or a list of Issue instances
      def command(command, issues = [])
        issues = issues.map { |item| { id: item.respond_to?("id") ? item.id : item } }
        post_resource_with_fields([], PATHS.commands, { query: command, issues: issues })
        true
      end

      private

      def model
        Models::Issue
      end

    end
  end
end
