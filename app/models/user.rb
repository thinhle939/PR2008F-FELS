class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  class << self

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] &&
          session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end


    def from_omniauth auth
      user = User.find_by provider: auth.provider, uid: auth.uid
      email = auth.info.email || auth.uid + "@" + auth.provider + ".com"

      user ||= User.create!(
        provider: auth.provider,
        uid: auth.uid,
        name: auth.info.name,
        email: email,
        password: Devise.friendly_token[0, 20]
      )
    end
  end
end
