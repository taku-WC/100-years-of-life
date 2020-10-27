class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image, destroy: false

  # バリデーション
  validates :name, presence: true
  validates :email, presence: true
# ゲストログイン
  def self.guest
    User.find_by(email: 'guest1@guest1')
  end
# google API
  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.create!(
        name: auth.info.name,
        email: auth.info.email,
        provider: auth.provider,
        uid: auth.uid,
        token: auth.credentials.token,
        password: Devise.friendly_token[0, 20],
        meta: auth.to_yaml)
    end
    user
  end
#検索機能
  def self.search(search)
    User.where(['name LIKE ?', "%#{search}%"])
  end
end
