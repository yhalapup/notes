class Note < ApplicationRecord
  validates :title, presence: true, length: { in: 1..50 }
  validates :content, presence: true, length: { in: 1..10_000 }
end
