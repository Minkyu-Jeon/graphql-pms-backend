module Types
  class BoardType < BaseObject
    description "보드 모델"

    field :board_type, GraphQL::STRING_TYPE, null: false
    field :project, Types::ProjectType, resolve: -> (board, _args, _ctx) { board.project }, null: false
    field :workflows, [Types::WorkflowType], resolve: -> (board, _args, _ctx) { board.workflows }, null: false
  end
end