document.addEventListener('turbolinks:load', function() {
  var progressBar = document.getElementById('testPassageProgress')
  if (progressBar === null) { return }

  var currentQuestionNumber = progressBar.dataset.questionNumber
  var questionsCount = progressBar.dataset.questionsCount
  var progress = Math.round((currentQuestionNumber-1) / questionsCount * 100)

  progressBar.ariaValueNow = progress
  progressBar.style.width = progress + '%'
  progressBar.textContent = progress + '%'
})

