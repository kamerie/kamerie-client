class User < ActiveRecord::Base
  include ActiveModel::Serialization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:reddit]
end
