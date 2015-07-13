module API
  module V1
    class UsersController < API::V1::BaseController
      acts_as_token_authenticatable

      devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable
    end
  end
end
