require 'sinatra'
require 'barrister'

class KungFu
  def kick
    return "You just got rounded housed!!"
  end

  def finish_him
    return "MK2 = FORWARD FORWARD BACK FORWARD"
  end
end

contract = Barrister::contract_from_file "./kung-fu.json"
server   = Barrister::Server.new contract
server.add_handler("KungFu", KungFu.new)

post '/kung_fu' do
  request.body.rewind
  resp = server.handle_json(request.body.read)

  status 200
  headers "Content-Type" => "application/json"
  resp
end
