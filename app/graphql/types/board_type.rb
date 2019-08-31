module Types
  class BoardType < BaseObject
    description "보드 모델"

    field :board_type, GraphQL::STRING_TYPE, null: false
    field :project, Types::ProjectType, null: false
    field :workflows, [Types::WorkflowType], null: false
  end
end