module Youtrack
  class Client
    attr_reader :base_url, :token

    def initialize(base_url:, token:)
      @base_url = normalize_base_url(base_url)
      @token = token
    end

    def get(path, options = {})
      RestClient::Request.execute(
        method: :get,
        url: request_url(path),
        headers: default_headers.merge(options.delete(:headers) || {}),
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
      [base_url, path].join("/")
    end

    def normalize_base_url(base_url)
      if base_url.match(/\/$/)
        base_url = base_url.slice(0, -1)
      end
      unless base_url.match(/api$/i)
        base_url += "/api"
      end
      base_url
    end
  end
end
