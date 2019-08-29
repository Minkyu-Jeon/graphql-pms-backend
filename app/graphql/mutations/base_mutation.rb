module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    object_class Types::BaseObject
    field_class Types::BaseField
    input_object_class Types::BaseInputObject

    field :errors, [GraphQL::STRING_TYPE],
          null: false,
          description: "Reasons why the mutation failed."

    def current_user
      context[:current_user]
    end

    # Returns Array of errors on an ActiveRecord object
    def errors_on_object(record)
      'TODO: implement'
    end
  end
end