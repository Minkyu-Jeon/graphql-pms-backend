module Types
  class TaskActionLogType < BaseObject
    description "태스크 액션 로그 타입"

    field :task, Types::TaskType, null: false
    field :before_workflow, Types::WorkflowType, resolve: -> (task_action_log, _args, _ctx) { task_action_log.before_workflow }, null: true
    field :current_workflow, Types::WorkflowType, resolve: -> (task_action_log, _args, _ctx) { task_action_log.current_workflow }, null: false
  end
end