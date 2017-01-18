class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness:
  { message: "Username has already been taken!" }


  validates :email, presence: true, uniqueness:
  { message: "Email has already been taken!" }

  validates_format_of :email,
  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
  on: :create,
  message: "Invalid email!"

  has_secure_password
end
