module Youtrack
  module Models
    class IssueCustomField < Base

      field "id"
      field "name"
      has_one "value", IssueCustomFieldValue, extended: false

    end
  end
end
