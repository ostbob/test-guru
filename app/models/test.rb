class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.get_tests_by_category(category)
    self.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
