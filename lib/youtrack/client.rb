require 'rest-client'
require "active_support"
require 'active_support/core_ext'

module Youtrack
  class Client
    attr_reader :base_url, :token

    def initialize(base_url:, token:)
      @base_url = normalize_base_url(base_url)
      @token = token
      RestClient.log = $stdout if ENV["DEBUG"]
    end

    def users
      @users ||= Resources::Users.new(client: self)
    end

    def issues
      @issues ||= Resources::Issues.new(client: self)
    end

    def projects
      @projects ||= Resources::Projects.new(client: self)
    end

    def get(path, options = {})
      execute(:get, path, options)
    end

    def post(path, payload, options = {})
      execute(:post, path, options.merge(payload: payload))
    end

    def delete(path, options = {})
      execute(:delete, path, options)
    end

    def execute(method, path, options = {})
      RestClient::Request.execute(
        method: method,
        url: request_url(path),
        headers: default_headers
                   .merge(options.delete(:headers) || {})
                   .merge(params: options.delete(:params) || {}),
        **options
      )
    rescue RestClient::Exception => e
      if e.http_body.present?
        e.message = e.http_body
      end
      raise e
    end

    private

    def default_headers
      {
        "Authorization" => "Bearer #{token}",
        'Content-Type' => :json
      }
    end

    def request_url(path)
      [base_url, path].join("")
    end

    def normalize_base_url(base_url)
      if base_url.match(/\/$/)
        base_url = base_url[0..-2]
      end
      unless base_url.match(/api$/i)
        base_url += "/api"
      end
      base_url
    end
  end
end
