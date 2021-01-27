export LESS='-i -M -R -W -q -S'
export EDITOR="vim"

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=
shopt -s histappend
shopt -s histverify
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export GOPATH="$HOME/repos"
export PATH=$PATH:/usr/local/go/bin # for go
export PATH=$PATH:$GOPATH/bin # for go built binary
export PATH=$PATH:/usr/local/opt/llvm/bin/ # for clangd from brew
export PATH=$PATH:/usr/local/opt/mysql-client/bin # for MySQL cli from brew

[ -x "$(command -v stern)" ] && source <(stern --completion=bash)
[ -x "$(command -v kubectl)" ] && source <(kubectl completion bash)


__git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d'  -e 's/* \(.*\)/\1/'
}

__short_pwd() {
	pwd \
	| sed -e 's#'"$HOME"'#~#g' \
	| sed -e 's#repos#r#g' \
	| sed -e 's#src#s#g' \
	| sed -e 's#github.com#g#g'
}

export PS1="\$(__short_pwd) \[\033[36m\]\$(__git_branch)\[\033[00m\] $ "

alias ls='ls -GF'
alias ll='ls -alh'
alias g='git'
alias vi='vim'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

__git_complete g __git_main

# complete -F __start_kubectl kubecolor

export PATH="/Users/ygnmhdtt/repos/dty1er/kubernetes/third_party/etcd:${PATH}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
