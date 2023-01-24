module Youtrack
  module Resources
    class Users < Base
      PATHS = OpenStruct.new(
        current: '/users/me',
        users: '/users',
        user: '/users/{user_id}'
      )

      def current
        get_resource_with_fields(Models::User, PATHS.current)
      end

    end
  end
end
