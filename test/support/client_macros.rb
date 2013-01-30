module ClientMacros
  def local_client
    client = Seesaw::Client.new(access_token: '9774e653f7b3c1de5f21b61adc08ba24', api_host: 'localhost:5000', api_scheme: 'http')
  end
end
