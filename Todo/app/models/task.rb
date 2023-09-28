class Task < ApplicationRecord
  validates :name, presence: true
  validates :memo, presence: true
  validates :position, presence: true
end
