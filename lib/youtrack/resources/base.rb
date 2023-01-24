module Youtrack
  module Resources
    class Base
      attr_reader :client

      def initialize(client:)
        @client = client
      end

      def get_resource_with_fields(fields, path, options = {})
        response = client.get(path, params: { fields: fields.map(&:to_query).join(",") }.merge(options.delete(:params) || {}))
        json = JSON.parse(response.body)
        model.from_json(json)
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
    end
  end
end
