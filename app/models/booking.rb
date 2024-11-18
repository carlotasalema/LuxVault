class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :start_date, :end_date, :status, presence: true
  validates :status, acceptance: { accept: ['pending', 'accepted'] }
  validates :item, :user, uniqueness: { scope: %i[item_id user_id] }
end
