class BadgeIssuerService
  attr_reader :test_passage, :test, :user

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      if self.send("#{badge.rule}?", badge.value)
        @user.badges << badge
      end
    end
  end

  private

  def category_tests_completed?(category)
    return false if @test.category.title.downcase != category.downcase

    category_tests_count = Test.joins("INNER JOIN categories ON tests.category_id = categories.id")
                               .where('lower(categories.title) = ?', category.downcase)
                               .pluck(:id).uniq.count
    category_test_passages_count = TestPassage.joins("INNER JOIN tests ON tests.id = test_passages.test_id
                                                INNER JOIN categories ON tests.category_id = categories.id")
                                        .where("lower(categories.title) = ?", category.downcase)
                                        .where({ user: @user, success_flg: true })
                                        .pluck(:test_id).uniq.count
    category_tests_count == category_test_passages_count
  end

  def test_first_try_successful?(_rule_value)
    TestPassage.where(test: @test, user: @user).count == 1
  end

  def level_tests_completed?(level)
    return false if @test.level != level.to_i

    level_tests_count = Test.where('level = ?', level.to_i)
                          .pluck(:id).uniq.count
    level_test_passages_count = TestPassage.joins("INNER JOIN tests ON tests.id = test_passages.test_id")
                                        .where("level = ?", level.to_i)
                                        .where(user: @user, success_flg: true)
                                        .pluck(:test_id).uniq.count
    level_tests_count == level_test_passages_count
  end

end
