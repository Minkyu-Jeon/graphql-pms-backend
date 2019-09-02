module Mutations
  module Users
    class Create < Mutations::BaseMutation
      graphql_name 'CreateUser'
      
      argument :email, GraphQL::STRING_TYPE, required: true
      argument :password, GraphQL::STRING_TYPE, required: true

      field :user, Types::UserType, null: true
      field :errors, [GraphQL::STRING_TYPE], null: false

      def resolve(email:, password:)
        user = User.new(email: email, password: password)

        if user.save
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