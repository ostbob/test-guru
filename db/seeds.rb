# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories
categories = Category.create!(
  [{ title: 'Programming Language'},
   {title: 'History'},
   {title: 'Finance'}]
)

# Users
users = User.create!([
  { email: 'bill@gmail.com', first_name: 'Bill', last_name: 'Murray', password: 'password'},
  { email: 'mike@gmail.com', first_name: 'Mike', last_name: 'Tyson', password: 'password'},
  { email: 'conan@gmail.com', first_name: 'Conan', last_name: 'McGregor', password: 'password'},
  { email: 'habib@gmail.com', first_name: 'Habib', last_name: 'Nurmagomedov', password: 'password'}
])

# Tests
tests = Test.create!([
  { title: 'Ruby', level: 1, category_id: categories[0].id, author_id: 1, allotted_time: 5},
  { title: 'Java', level: 2, category_id: categories[0].id, author_id: 1, allotted_time: 1},
  { title: 'Russian History', level: 3, category_id: categories[1].id, author_id: 1},
  { title: 'American Civil War', level: 3, category_id: categories[1].id, author_id: 1},
  { title: 'Corporate Finance', level: 4, category_id: categories[2].id, author_id: 1}
])

# TestPassages
testPassages = TestPassage.create!([
  { user_id: users[0].id, test_id: tests[0].id},
  { user_id: users[0].id, test_id: tests[1].id},
  { user_id: users[0].id, test_id: tests[2].id},
  { user_id: users[1].id, test_id: tests[0].id},
  { user_id: users[2].id, test_id: tests[0].id}
])

# Questions
questions = Question.create!([
  { body: 'Is Ruby a strongly typed language?', test_id: tests[0].id},
  { body: 'Ruby is an object oriented general purpose programming language.', test_id: tests[0].id},
  { body: '...... syntax matches with the Ruby syntax.', test_id: tests[0].id},
  { body: 'Which of the following is the file extension used for saving the ruby file?', test_id: tests[0].id},
  { body: 'What are the sequence of ruby strings?', test_id: tests[0].id},
  { body: 'Which of the following type of comments are valid in Ruby?', test_id: tests[0].id},
  { body: 'What is Ruby?', test_id: tests[0].id},
  { body: 'Ruby was developed by ......', test_id: tests[0].id},
  { body: 'What of the following is the default value of a local variable?', test_id: tests[1].id},
  { body: 'What is the size of double variable?', test_id: tests[1].id},
  { body: 'What is the default value of short variable?', test_id: tests[1].id},
  { body: 'What is class variable?', test_id: tests[1].id}
])

# Answers
answers = Answer.create!([
  { title: 'No', correct: false, question: questions[0]},
  { title: 'Yes', correct: true, question: questions[0]},
  { title: 'False', correct: false, question: questions[1]},
  { title: 'True', correct: true, question: questions[1]},
  { title: 'Java', correct: false, question: questions[2]},
  { title: 'Python', correct: false, question: questions[2]},
  { title: 'Perl', correct: true, question: questions[2]},
  { title: '.ruby', correct: false, question: questions[3]},
  { title: '.rrb', correct: false, question: questions[3]},
  { title: '.rb', correct: true, question: questions[3]},
  { title: '8-bit bytes', correct: true, question: questions[4]},
  { title: '16-bit bytes', correct: false, question: questions[4]},
  { title: '32-bit bytes', correct: false, question: questions[4]},
  { title: 'Single Line', correct: false, question: questions[5]},
  { title: 'Multiple Line', correct: false, question: questions[5]},
  { title: 'Both Single & Multiple Line', correct: true, question: questions[5]},
  { title: 'Markup language', correct: false, question: questions[6]},
  { title: 'Procedural language', correct: false, question: questions[6]},
  { title: 'Scripting language', correct: true, question: questions[6]},
  { title: 'Vladimir Putin', correct: false, question: questions[7]},
  { title: 'Brendan Eich', correct: false, question: questions[7]},
  { title: 'Yukihiro Matsumoto', correct: true, question: questions[7]},
  { title: 'null', correct: false, question: questions[8]},
  { title: '0', correct: false, question: questions[8]},
  { title: 'Not assigned', correct: true, question: questions[8]},
  { title: '8 bit', correct: false, question: questions[9]},
  { title: '16 bit', correct: false, question: questions[9]},
  { title: '64 bit', correct: true, question: questions[9]},
  { title: '0.0', correct: false, question: questions[10]},
  { title: 'null', correct: false, question: questions[10]},
  { title: 'not defined', correct: false, question: questions[10]},
  { title: '0', correct: true, question: questions[10]},
  { title: 'class variables are static variables within a class but outside any method.', correct: true, question: questions[11]},
  { title: 'class variables are variables defined inside methods, constructors or blocks.', correct: false, question: questions[11]},
  { title: 'class variables are variables within a class but outside any method.', correct: false, question: questions[11]},
  { title: 'None of the above.', correct: false, question: questions[11]}
])

