module Youtrack
  module Models
    class User < Base

      field "id"
      field "email"
      field "fullName"
      field "login"
      field "name"

      field "avatarUrl", extended: true
      field "banned", extended: true
      field "online", extended: true
      field "guest", extended: true
      field "jabberAccountName", extended: true
      field "ringId", extended: true

      has_many "tags", Tag
    end
  end
end
