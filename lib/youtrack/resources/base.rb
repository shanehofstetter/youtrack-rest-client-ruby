module Youtrack
  module Resources
    class Base
      attr_reader :client

      def initialize(client:)
        @client = client
      end

      def get_resource_with_fields(fields, path, options = {})
        query_params = query_params_for_fields(fields).merge(options.delete(:params) || {})
        response = client.get(path, { params: query_params })
        deserialize_response(response)
      end

      def post_resource_with_fields(fields, path, data)
        payload = data.respond_to?(:to_json) ? data.to_json : data
        response = client.post(path, payload, { params: query_params_for_fields(fields) })
        deserialize_response(response)
      end

      def delete_resource(path)
        client.delete(path)
        true
      end

      def query_params_for_fields(fields)
        { fields: fields.map(&:to_query).join(",") }
      end

      def deserialize_response(response)
        json = JSON.parse(response.body)
        model.from_json(json)
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
    end
  end
end
