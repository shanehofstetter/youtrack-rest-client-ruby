module Youtrack
  module Models
    class Project < Base

      field "id"
      field "name"
      field "shortName"
      field "description"
      field "archived"

      has_one "createdBy", User, extended: true
      # has_many "fields", Field, extended: true
      field "fromEmail", extended: true
      field "hubResourceId", extended: true
      field "iconUrl", extended: true
      field "timeTrackingEnabled", extended: true
      has_one "leader", User, extended: true

    end
  end
end
