class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
 # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :posts
  has_many :comments
 def jwt_payload
   super
 end
end
