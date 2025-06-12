module Mutations
  class LoginUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false
    field :token, String, null: true
    field :client, String, null: true
    field :uid, String, null: true

    def resolve(email:, password:)
      user = User.find_for_database_authentication(email: email)
      if user&.valid_password?(password)
        token_hash = user.create_new_auth_token
        {
          user: user,
          errors: [],
          token: token_hash["access-token"],
          client: token_hash["client"],
          uid: token_hash["uid"]
        }
      else
        {
          user: nil,
          errors: ["Invalid email or password"],
          token: nil,
          client: nil,
          uid: nil
        }
      end
    end
  end
end 