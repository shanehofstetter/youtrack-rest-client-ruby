module Youtrack
  module Resources
    class Projects < Base
      PATHS = OpenStruct.new(
        projects: '/admin/projects',
      )

      def all(options = {})
        get_resource_with_fields(model.minimal_fields, PATHS.projects, params: options)
      end

      private

      def model
        Models::Project
      end

    end
  end
end
