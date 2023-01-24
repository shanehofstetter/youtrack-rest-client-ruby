module Youtrack
  module Models
    class Issue < Base

      field "id"
      field "idReadable"
      field "numberInProject"
      field "created"
      field "updated"
      field "resolved"
      has_one "project", Project, extended: false
      field "summary"
      field "description"

      has_one "reporter", User, extended: true
      has_one "updater", User, extended: true
      field "wikifiedDescription", extended: true
      field "usesMarkdown", extended: true
      has_many "fields", IssueCustomField, extended: true
      field "isDraft", extended: true
      has_many "tags", Tag, extended: true
      # has_many "links", Link, extended: true
      # has_many "comments", Comment, extended: true
    end
  end
end
