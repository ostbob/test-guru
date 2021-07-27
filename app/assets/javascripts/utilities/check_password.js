document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('#user_password')
  var password_confirmation = document.querySelector('#user_password_confirmation')

  if (password && password_confirmation ) {
    password.addEventListener('input', checkPasswords)
    password_confirmation.addEventListener('input', checkPasswords)
  }
})

function checkPasswords() {
  var password = document.querySelector('#user_password')
  var password_confirmation = document.querySelector('#user_password_confirmation')
  var success_icon = document.querySelector('.octicon-check-circle')
  var fail_icon = document.querySelector('.octicon-x-circle-fill')

  if(password.value === "" || password_confirmation.value === "") {
    success_icon.classList.add('hide')
    fail_icon.classList.add('hide')
    return
  }

  if(password.value == password_confirmation.value) {
    fail_icon.classList.add('hide')
    success_icon.classList.remove('hide')
  } else {
    fail_icon.classList.remove('hide')
    success_icon.classList.add('hide')
  }
}
