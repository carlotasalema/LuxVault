class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, :category, :price_per_day, :description, presence: true
  validates :category, acceptance: { accept: ['clothing', 'accessories', 'jewelry'] }
  validates :description, length: { in: 5..400 }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
