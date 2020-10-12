class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image, destroy: false

  # バリデーション
  validates :name, presence: true
  validates :email, presence: true

  def self.guest
    find_or_create_by!(name: 'ゲスト',  email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
