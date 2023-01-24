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

    def get(path, options = {})
      RestClient::Request.execute(
        method: :get,
        url: request_url(path),
        headers: default_headers
                   .merge(options.delete(:headers) || {})
                   .merge(params: options.delete(:params) || {}),
        **options
      )
    end

    private

    def default_headers
      {
        "Authorization" => "Bearer #{token}"
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
