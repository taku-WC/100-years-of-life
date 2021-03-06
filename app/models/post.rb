class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_relations

  attachment :post_image

  validates :post, presence: true, length: { maximum: 500}

  # 引数で渡されたユーザidがFavoritesテーブル内user_idカラムに存在（exists?）するかどうかを調べる
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
