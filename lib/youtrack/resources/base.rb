module Youtrack
  module Resources
    class Base
      attr_reader :client

      def initialize(client:)
        @client = client
      end

      def get_resource_with_fields(model_class, path)
        client.get(path, params: { fields: model_class.to_fields_query })
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
    end
  end
end
