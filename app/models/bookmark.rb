class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates_associated :movie, uniqueness: true, presence: true
  validates_associated :list, uniqueness: true, presence: true
  validates :comment, length: { minimum: 6 }, presence: true
  validates :movie, uniqueness: { scope: :list }
end
