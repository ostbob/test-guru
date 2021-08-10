class Badge < ApplicationRecord
  has_many :users_badges
  has_many :users, through: :users_badges

  validates :name, :image, presence: true

  RULES = [
    ['All category tests are completed.', :category_tests_completed],
    ['Test first try is successful.', :test_first_try_successful],
    ['All level tests are completed.', :level_tests_completed]
  ]

  def self.images
    images_path = 'app/assets/images/'
    images = Dir.glob("app/assets/images/badges/*")
    images.each {|image| image[images_path] = ''}
  end
end
