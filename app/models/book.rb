class Book < ApplicationRecord
  # has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true,
    length: { maximum: 200 }
  
  
  # def get_image
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image
  # end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[title body] # 検索可能にしたい属性のみを列挙
  end
  def self.ransackable_associations(auth_object = nil)
    ["book_comments", "favorites", "post_comments"]
  end
end
