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
          @extended
        end

        def to_query
          name
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
          attr_accessor name.underscore
        end

        def has_many(name, extended: true, model:)
          @fields ||= []
          @fields << Field.new(name: name, extended: extended, model: model, type: :many)
          attr_accessor name.underscore
        end

        def has_one(name, extended: true, model:)
          @fields ||= []
          @fields << Field.new(name: name, extended: extended, model: model, type: :one)
          attr_accessor name.underscore
        end

      end

    end
  end
end
