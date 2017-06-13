module JWTWrapper
  def self.decode(token)
    decoded_token = Warden::JWTAuth::UserDecoder.new.call(token, :user)
  end
end