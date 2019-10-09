# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[psu]

  has_many :works, foreign_key: 'depositor_id', inverse_of: 'depositor', dependent: :restrict_with_exception
  has_many :access_controls, as: :agent, dependent: :destroy

  def self.from_omniauth(auth)
    ## TODO update if different
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.access_id = auth.info.access_id
      # user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  # def self.update_oauth_credentials(auth)
  # end
end
