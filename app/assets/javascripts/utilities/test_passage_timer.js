document.addEventListener('turbolinks:load', function() {
  var timerDiv = document.getElementById('testPassageTimer')
  var deadlineTime = document.getElementById('hidden_deadline_time')
  var createdAt = document.getElementById('hidden_created_at')

  if (timerDiv === null || deadlineTime === null) { return }

  setInterval(function() {
    let timeLeft = Math.max(new Date(deadlineTime.textContent) - new Date(), 0)/1000
    let timeLeftString = parseInt(timeLeft/60) + ':' + parseInt(timeLeft%60)
    timerDiv.textContent = timeLeftString

    if(timeLeft === 0) {
      document.querySelector('form').submit()
    }
  }, 1000)
})

