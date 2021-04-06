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
  { title: 'Test 1', level: 1, category_id: 1},
  { title: 'Test 2', level: 2, category_id: 1},
  { title: 'Test 3', level: 3, category_id: 2},
  { title: 'Test 4', level: 3, category_id: 2},
  { title: 'Test 5', level: 4, category_id: 3}
])

# TestPassages
testPassages = TestPassage.create([
  { user_id: 1, test_id: 1},
  { user_id: 1, test_id: 2},
  { user_id: 1, test_id: 3},
  { user_id: 2, test_id: 1},
  { user_id: 3, test_id: 1}
])

# Questions
questions = Question.create([
  { body: 'Question 1', test_id: 1},
  { body: 'Question 2', test_id: 1},
  { body: 'Question 3', test_id: 1},
  { body: 'Question 4', test_id: 2},
  { body: 'Question 5', test_id: 2},
  { body: 'Question 6', test_id: 2},
  { body: 'Question 7', test_id: 3},
  { body: 'Question 8', test_id: 3},
  { body: 'Question 9', test_id: 4},
  { body: 'Question 10', test_id: 5}
])

# Answers
answers = Answer.create([
  { title: 'Answer 1', correct: false, question_id: 1},
  { title: 'Answer 2', correct: false, question_id: 1},
  { title: 'Answer 3', correct: true, question_id: 1},
  { title: 'Answer 4', correct: false, question_id: 2},
  { title: 'Answer 5', correct: false, question_id: 2},
  { title: 'Answer 6', correct: true, question_id: 2},
  { title: 'Answer 7', correct: false, question_id: 3},
  { title: 'Answer 8', correct: false, question_id: 3},
  { title: 'Answer 9', correct: true, question_id: 3},
  { title: 'Answer 10', correct: false, question_id: 4},
  { title: 'Answer 11', correct: false, question_id: 4},
  { title: 'Answer 12', correct: true, question_id: 4},
  { title: 'Answer 13', correct: false, question_id: 5},
  { title: 'Answer 14', correct: false, question_id: 5},
  { title: 'Answer 15', correct: true, question_id: 5},
  { title: 'Answer 16', correct: false, question_id: 6},
  { title: 'Answer 17', correct: false, question_id: 6},
  { title: 'Answer 18', correct: true, question_id: 6},
  { title: 'Answer 19', correct: false, question_id: 7},
  { title: 'Answer 20', correct: false, question_id: 7},
  { title: 'Answer 21', correct: true, question_id: 7},
  { title: 'Answer 22', correct: false, question_id: 8},
  { title: 'Answer 23', correct: false, question_id: 8},
  { title: 'Answer 24', correct: true, question_id: 8},
  { title: 'Answer 25', correct: false, question_id: 9},
  { title: 'Answer 26', correct: false, question_id: 9},
  { title: 'Answer 27', correct: true, question_id: 9},
  { title: 'Answer 28', correct: false, question_id: 10},
  { title: 'Answer 29', correct: false, question_id: 10},
  { title: 'Answer 30', correct: true, question_id: 10}
])

