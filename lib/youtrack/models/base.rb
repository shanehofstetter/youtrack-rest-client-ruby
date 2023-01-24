module Youtrack
  module Models
    class Base

      class << self
        attr_reader :fields

        def field(name)
          @fields ||= []
          @fields << name
          attr_accessor name.underscore
        end

        def to_fields_query
          fields.join(",")
        end
      end

    end
  end
end
