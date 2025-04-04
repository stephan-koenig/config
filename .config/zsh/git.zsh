# Generate PR summary in Sublime Text from commit subject and body
alias supr="
  git log origin..HEAD --reverse --format='- [%s](%H)%n%b' | hx"
