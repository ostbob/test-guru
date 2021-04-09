class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: [0..1]) }
  scope :middle, -> { where(level: [2..4]) }
  scope :complicated, -> { where(level: [5..Float::INFINITY]) }
  scope :by_category, -> (category) { joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }
end
