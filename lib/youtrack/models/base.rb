module Youtrack
  module Models
    class Base

      class Field
        attr_accessor :name, :extended, :model, :type

        def initialize(name:, extended: nil, model: nil, type: nil)
          @name = name
          @extended = extended
          @model = model
          @type = type
        end

        def extended?
          extended
        end

        def to_query
          if model.present?
            model_fields = model.minimal_fields
            "#{name}(#{model_fields.map(&:to_query).join(",")})"
          else
            name
          end
        end

        def to_s
          "Field name=#{name} extended=#{extended} model=#{model} type=#{type}"
        end

        def attr_name
          name.underscore
        end
      end

      class << self
        attr_reader :fields

        def all_fields
          fields
        end

        def minimal_fields
          fields.reject(&:extended?)
        end

        def field(name, extended: false)
          @fields ||= []
          @fields << Field.new(name: name, extended: extended)
          register_field_as_attr(@fields.last)
        end

        def has_many(name, model, extended: true)
          @fields ||= []
          @fields << Field.new(name: name, extended: extended, model: model, type: :many)
          register_field_as_attr(@fields.last)
        end

        def has_one(name, model, extended: true)
          @fields ||= []
          @fields << Field.new(name: name, extended: extended, model: model, type: :one)
          register_field_as_attr(@fields.last)
        end

        def register_field_as_attr(field)
          attr_accessor field.attr_name
        end

        def from_json(json)
          if json.is_a?(Array)
            json.map { |item| from_json(item) }
          elsif json.respond_to?(:each)
            self.new.tap do |instance|
              json.each do |key, value|
                field = fields.find { |f| f.name == key }
                next unless field.present?
                field_value = field.model.present? && value.present? ? field.model.from_json(value) : value
                instance.send(field.attr_name + "=", field_value)
              end
            end
          else
            # unknown type, could be a string/int value for an IssueCustomField
            json
          end
        end
      end

      def initialize(attrs = {})
        attrs.each do |k, v|
          next unless respond_to?(k.to_s + "=")
          send(k.to_s + "=", v)
        end
      end

      def to_h
        self.class.all_fields.map do |field|
          value = send(field.attr_name)
          if field.model.present?
            if value.is_a?(Array)
              value = value.map(&:to_h)
            elsif value.present?
              value = value.to_h
            end
          end
          [field.attr_name, value]
        end.to_h
      end

      alias_method :to_hash, :to_h

      def as_payload
        to_h.compact.to_json
      end

    end
  end
end
