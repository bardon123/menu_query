module Mutations
  class RegisterUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false
    field :token, String, null: true
    field :client, String, null: true
    field :uid, String, null: true

    def resolve(email:, password:, password_confirmation:)
      user = User.new(
        email: email,
        password: password,
        password_confirmation: password_confirmation
      )
      if user.save
        # Generate authentication token using DeviseTokenAuth
        user.create_new_auth_token.tap do |token_hash|
          return {
            user: user,
            errors: [],
            token: token_hash["access-token"],
            client: token_hash["client"],
            uid: token_hash["uid"]
          }
        end
      else
        { user: nil, errors: user.errors.full_messages, token: nil, client: nil, uid: nil }
      end
    end
  end
end 