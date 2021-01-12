class Lesson < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_one :order

  has_many :favorites, dependent: :destroy


  def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
  end

  # 空の投稿を保存できないようにする
  validates :name, :introduction,:delivery,:bring,:recipe,:flow,:eventday,:deadline, :prefecture_id, :capacity_id, :price,
            :image, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
    validates :capacity_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/i } # 半角数字のみか

  extend ActiveHash::Associations::ActiveRecordExtensions # プルダウンメニューアクティブハッシュ
  belongs_to :prefecture
  belongs_to :capacity
end