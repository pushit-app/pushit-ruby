module Pushit
  class Channel
    require 'openssl'
    require 'multi_json'

    def initialize(channel_name, options = {})
        options               = {
          scheme: 'https',
          host:   'ws.slaask.com'
        }.merge(options)

        @channel_name         = channel_name
        @scheme, @host, @port = options.values_at(
          :scheme, :host, :port
        )
    end

    def post(event, data = {})
      Request.new(:post, url(event)).post(data)
    end

    private

    def url(event)
      URI::HTTPS.build({
        scheme: @scheme,
        host:   @host,
        port:   @port,
        path:   "/publish/#{@channel_name}/#{event}"
      })
    end
  end
end
