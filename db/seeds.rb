# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories
categories = Category.create([{ title: 'category 1'}, {title: 'category 2'}, {title: 'category 3'}])

# Users
users = User.create([
  { email: 'bill@gmail.com', first_name: 'Bill', last_name: 'Murray'},
  { email: 'mike@gmail.com', first_name: 'Mike', last_name: 'Tyson'},
  { email: 'conan@gmail.com', first_name: 'Conan', last_name: 'McGregor'},
  { email: 'habib@gmail.com', first_name: 'Habib', last_name: 'Nurmagomedov'}
])

# Tests
tests = Test.create([
  { title: 'Test 1', level: 1, category_id: categories[0].id},
  { title: 'Test 2', level: 2, category_id: categories[0].id},
  { title: 'Test 3', level: 3, category_id: categories[1].id},
  { title: 'Test 4', level: 3, category_id: categories[1].id},
  { title: 'Test 5', level: 4, category_id: categories[2].id}
])

# TestPassages
testPassages = TestPassage.create([
  { user_id: users[0].id, test_id: tests[0].id},
  { user_id: users[0].id, test_id: tests[1].id},
  { user_id: users[0].id, test_id: tests[2].id},
  { user_id: users[1].id, test_id: tests[0].id},
  { user_id: users[2].id, test_id: tests[0].id}
])

# Questions
questions = Question.create([
  { body: 'Question 1', test_id: tests[0].id},
  { body: 'Question 2', test_id: tests[0].id},
  { body: 'Question 3', test_id: tests[0].id},
  { body: 'Question 4', test_id: tests[1].id},
  { body: 'Question 5', test_id: tests[1].id},
  { body: 'Question 6', test_id: tests[1].id},
  { body: 'Question 7', test_id: tests[2].id},
  { body: 'Question 8', test_id: tests[2].id},
  { body: 'Question 9', test_id: tests[3].id},
  { body: 'Question 10', test_id: tests[4].id}
])

# Answers
answers = Answer.create([
  { title: 'Answer 1', correct: false, question_id: questions[0].id},
  { title: 'Answer 2', correct: false, question_id: questions[0].id},
  { title: 'Answer 3', correct: true, question_id: questions[0].id},
  { title: 'Answer 4', correct: false, question_id: questions[1].id},
  { title: 'Answer 5', correct: false, question_id: questions[1].id},
  { title: 'Answer 6', correct: true, question_id: questions[1].id},
  { title: 'Answer 7', correct: false, question_id: questions[2].id},
  { title: 'Answer 8', correct: false, question_id: questions[2].id},
  { title: 'Answer 9', correct: true, question_id: questions[2].id},
  { title: 'Answer 10', correct: false, question_id: questions[3].id},
  { title: 'Answer 11', correct: false, question_id: questions[3].id},
  { title: 'Answer 12', correct: true, question_id: questions[3].id},
  { title: 'Answer 13', correct: false, question_id: questions[4].id},
  { title: 'Answer 14', correct: false, question_id: questions[4].id},
  { title: 'Answer 15', correct: true, question_id: questions[4].id},
  { title: 'Answer 16', correct: false, question_id: questions[5].id},
  { title: 'Answer 17', correct: false, question_id: questions[5].id},
  { title: 'Answer 18', correct: true, question_id: questions[5].id},
  { title: 'Answer 19', correct: false, question_id: questions[6].id},
  { title: 'Answer 20', correct: false, question_id: questions[6].id},
  { title: 'Answer 21', correct: true, question_id: questions[6].id},
  { title: 'Answer 22', correct: false, question_id: questions[7].id},
  { title: 'Answer 23', correct: false, question_id: questions[7].id},
  { title: 'Answer 24', correct: true, question_id: questions[7].id},
  { title: 'Answer 25', correct: false, question_id: questions[8].id},
  { title: 'Answer 26', correct: false, question_id: questions[8].id},
  { title: 'Answer 27', correct: true, question_id: questions[8].id},
  { title: 'Answer 28', correct: false, question_id: questions[9].id},
  { title: 'Answer 29', correct: false, question_id: questions[9].id},
  { title: 'Answer 30', correct: true, question_id: questions[9].id}
])

