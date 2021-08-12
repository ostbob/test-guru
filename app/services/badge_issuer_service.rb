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

    category_tests_count = Test.by_category(category).pluck(:id).uniq.count

    category_test_passages_count = TestPassage.joins(:test).merge(Test.by_category(category))
                                        .where({ user: @user, success: true })
                                        .pluck(:test_id).uniq.count

    category_tests_count == category_test_passages_count
  end

  def test_first_try_successful?(_rule_value)
    TestPassage.where(test: @test, user: @user).count == 1
  end

  def level_tests_completed?(level)
    level_tests_count = Test.send(level.downcase).pluck(:id).uniq.count

    level_test_passages_count = TestPassage.joins(:test).merge(Test.send(level.downcase))
                                        .where(user: @user, success: true)
                                        .pluck(:test_id).uniq.count

    level_tests_count == level_test_passages_count
  end

end
