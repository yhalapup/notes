class ExternalNotes::Api::Client
  BASE_URL = "http://externalnotes:4567".freeze

  def get(path:, params: {}, headers: {})
    client.public_send(:get, path, params, headers)
  end

  private

  def client
    @client ||= Faraday.new(url: BASE_URL) do |config|
      config.request :json
      config.response :json
      config.response :raise_error
      config.response :logger, Rails.logger, headers: true, bodies: true, log_level: :debug do |fmt|
        fmt.filter(/^(Authorization: ).*$/i, '\1[REDACTED]')
      end
      config.adapter :net_http
    end
  end
end
