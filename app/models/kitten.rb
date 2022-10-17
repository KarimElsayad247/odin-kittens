class Kitten < ApplicationRecord
  validates :name, :age, :softness, :cuteness, presence: true
end
