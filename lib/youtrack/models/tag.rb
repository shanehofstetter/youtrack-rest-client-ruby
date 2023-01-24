module Youtrack
  module Models
    class Tag < Base

      field "id"
      field "name"
      field "untagOnResolve"

      has_one "owner", User

    end
  end
end
