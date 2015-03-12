class User < ActiveRecord::Base
  # Include devise modules:
  devise :confirmable, :database_authenticatable, :lockable, :omniauthable, :registerable,
         :recoverable, :rememberable, :timeoutable, :trackable, :validatable
end
