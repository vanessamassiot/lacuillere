class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates_presence_of :content, :rating, :restaurant_id

  validates :rating, inclusion: { in: [0,1,2,3,4,5], allow_nil: false }
  validates :rating, numericality: { only_integer: true }

end
