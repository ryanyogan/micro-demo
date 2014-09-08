class Services
  def self.user_service
    @@services ||= proxy_services
    @@services[:user_service]
  end

  # Showing non Redis, Node services, anything can be used
  def self.calc_service
    @@services ||= proxy_services
    @@services[:calc_service]
  end

  def self.kung_fu_service
    @@services ||= proxy_services
    @@services[:kung_fu_service]
  end


  def self.proxy_services
    opts      = { database_url: 'redis://localhost:6379' }
    transport = Barrister::RedisTransport.new 'user_service', opts
    client    = Barrister::Rails::Client.new transport

    node_transport = Barrister::HttpTransport.new "http://localhost:7667/calc"
    node_client    = Barrister::Client.new(node_transport)

    kung_fu_transport = Barrister::HttpTransport.new "http://localhost:4567/kung_fu"
    kung_fu_client    = Barrister::Client.new(kung_fu_transport)

    {
      user_service: client.UserService,
      calc_service: node_client.Calculator,
      kung_fu_service: kung_fu_client.KungFu
    }

  end
end
