class User < ActiveRecord::Base
  include Clearance::User

  rails_admin do
    list do
      field :email
      field :admin
      field :created_at
      field :updated_at
    end

    edit do
      field :admin
      field :email
      field :password
    end

    exclude_fields :id, :confirmation_token
  end
end
