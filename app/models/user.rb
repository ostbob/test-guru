class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  def get_passing_tests_by_level(level)
    tests.where(level: level)
  end
end
