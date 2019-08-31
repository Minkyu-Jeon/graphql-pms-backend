module Types
  class WorkflowType < BaseObject
    description "워크플로우 모델"

    field :title, GraphQL::STRING_TYPE, null: false
    field :tasks, [Types::TaskType], null: true
  end
end