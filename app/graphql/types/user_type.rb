module Types
  class UserType < BaseObject
    description "사용자 모델"
    field :email, GraphQL::STRING_TYPE, null: false
  end
end
