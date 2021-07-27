require 'rack/app'

class WebSocketApp < Rack::App
  def self.call(env)
    new.call(env)
  end

  def call(env)
    request_path = env[::Rack::PATH_INFO]

    if request_path == '/'
      ['200', {'Content-Type' => 'text/html'}, ['static endpoint']]
    end
  end
end
