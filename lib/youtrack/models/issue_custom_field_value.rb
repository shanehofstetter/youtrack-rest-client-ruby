module Youtrack
  module Models
    class IssueCustomFieldValue < Base

      field "id"
      field "name"
      field "localizedName"
      field "fullName"
      field "login"
      field "avatarUrl"
      field "isResolved"
      field "text"
      field "minutes"
      field "presentation"
      has_one "color", FieldStyle, extended: false

    end
  end
end
