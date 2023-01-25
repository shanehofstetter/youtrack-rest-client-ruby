module Youtrack
  module Resources
    class Projects < Base
      PATHS = OpenStruct.new(
        projects: '/admin/projects',
        project: '/admin/projects/%{id}',
      )

      def all(params = {})
        get_resource_with_fields(model.minimal_fields, PATHS.projects, params: params)
      end

      def by_id(id)
        get_resource_with_fields(model.all_fields, PATHS.project % { id: id })
      end

      private

      def model
        Models::Project
      end

    end
  end
end
