class Book < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :book_category
  
  with_options presence: true do
    validates :title, length: { maximum: 40, message: "タイトルは40文字以内で入力してください" }
    validates :impress, length: { maximum: 400, message: "感想は400文字以内で入力してください" }
    validates :book_category_id, numericality: {other_than: 1, message: "カテゴリーを入力してください"}
  end
end
