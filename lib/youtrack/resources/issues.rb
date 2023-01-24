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

      private

      def model
        Models::Issue
      end

    end
  end
end
