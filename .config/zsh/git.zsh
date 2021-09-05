# Overwite git plugin alias
alias glg="
  git log --all --graph \
    --format='format:%w(0,2,6)%C(bold blue)%h - \
    %C(bold cyan)%aD %C(bold yellow)(%ar)%C(auto)%d%n\
    %s%C(dim white) - %an%C(reset)'"