module Types
  class CommentType < BaseObject
    description "코멘트 타입"

    field :comment, GraphQL::STRING_TYPE, null: false
    field :task, Types::TaskType, null: false
    field :user, Types::UserType, null: false
  end
end