module Mutations
  module Sessions
    class Create < Mutations::BaseMutation
      graphql_name 'CreateSession'
      
      argument :email, GraphQL::STRING_TYPE, required: true
      argument :password, GraphQL::STRING_TYPE, required: true

      field :user, Types::UserType, null: true
      field :errors, [GraphQL::STRING_TYPE], null: false

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