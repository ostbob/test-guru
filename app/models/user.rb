class User < ApplicationRecord

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable

  EMAIL_PATTERN_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists
  has_many :feedbacks

  validates :email,
    presence: true,
    format: { with: EMAIL_PATTERN_REGEX },
    uniqueness: { case_sensitive: false }

  def get_passing_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end
