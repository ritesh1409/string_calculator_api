Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Change '*' to 'http://localhost:5173' for more security
    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      credentials: false
  end
end
