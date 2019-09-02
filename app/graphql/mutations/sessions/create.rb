module Mutations
  module Sessions
    class Create < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::UserType, null: true
      field :errors, [String], null: false

      def resolve(email:, password:)
        user = User.find_by(email: email)

        if user&.authenticate(password)
          token = Authentication::JsonWebToken.encode({user_id: user.id})
          cookies.signed[:jwt] = { value: token, httponly: true }
          {
            user: user,
            errors: []
          }
        else
          {
            user: nil,
            errors: user.errors.full_messages
          }
        end
      end
    end
  end
end