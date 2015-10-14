class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :address
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nil: false }

  # validates :stars, inclusion: { in: [1,2,3], allow_nil: false }
  # validates :name, uniqueness: true, presence: true
  # validates :address, presence: true
end
