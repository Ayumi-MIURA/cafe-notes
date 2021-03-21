class Note < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :geography
  belongs_to :processing
  with_options presence: true do
    validates :cafe_name
    validates :appearance
    validates :aroma
    validates :taste
    validates :rich
    validates :geography_id
    validates :processing_id
    validates :image
  end

  validates :geography_id, :processing_id, numericality: { other_than: 0 }

  def self.search(search)
    if search != ''
      Note.where('cafe_name LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end
end
