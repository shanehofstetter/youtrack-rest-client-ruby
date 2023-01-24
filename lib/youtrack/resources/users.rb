module Youtrack
  module Resources
    class Users < Base
      PATHS = OpenStruct.new(
        current: '/users/me',
        users: '/users',
        user: '/users/%{user_id}'
      )

      def current
        get_resource_with_fields(Models::User.all_fields, PATHS.current)
      end

      def all(options = {})
        get_resource_with_fields(Models::User.minimal_fields, PATHS.users, params: options)
      end

      def by_id(id)
        get_resource_with_fields(Models::User.all_fields, PATHS.user % { user_id: id })
      end

    end
  end
end
