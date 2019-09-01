module Authentication
  class JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

    class << self
      def encode(payload, expires = 24.hours.from_now)
        payload[:exp] = expires.to_i
        JWT.encode(payload, SECRET_KEY)
      end

      def decode(token)
        decode = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decode
      end
    end
  end
end