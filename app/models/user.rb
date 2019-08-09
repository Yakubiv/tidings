class User < ApplicationRecord
  enum role: %i[admin editor trainee]

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
