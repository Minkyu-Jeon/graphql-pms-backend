module Types
  class TaskActionLogType < BaseObject
    description "태스크 액션 로그 타입"

    field :task, Types::TaskType, null: false
    field :before_workflow, Types::WorkflowType, null: true
    field :current_workflow, Types::WorkflowType, null: false
  end
end