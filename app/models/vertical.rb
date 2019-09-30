class Vertical < ApplicationRecord
  include UniqueThroughTable
  has_many :categories
end
