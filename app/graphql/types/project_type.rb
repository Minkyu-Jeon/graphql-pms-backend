module Types
  class ProjectType < BaseObject
    description "프로젝트 모델"

    field :name, GraphQL::STRING_TYPE, null: false
    field :description, GraphQL::STRING_TYPE, null: false
    field :users, [Types::UserType], null: true
    field :boards, [Types::BoardType], null: true
    field :tasks, [Types::TaskType], null: true
  end
end