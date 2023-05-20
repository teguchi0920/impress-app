class Book < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :book_category
  
  validates :book_category_id, presence: true, numericality: {other_than: 1, message: "カテゴリーを入力してください"}
end
