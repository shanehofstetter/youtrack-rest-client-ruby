module Youtrack
  module Resources
    class Users < Base
      PATHS = OpenStruct.new(
        current: '/users/me',
        users: '/users',
        user: '/users/%{id}'
      )

      def current
        get_resource_with_fields(model.all_fields, PATHS.current)
      end

      def all(options = {})
        get_resource_with_fields(model.minimal_fields, PATHS.users, params: options)
      end

      def by_id(id)
        get_resource_with_fields(model.all_fields, PATHS.user % { id: id })
      end

      private

      def model
        Models::User
      end

    end
  end
end
