export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --border \
  --height 40% \
  --layout=reverse \
  --color=bg+:#141A1F \
  --color=fg:#B2C1CC \
  --color=fg+:#B2C1CC \
  --color=hl:#52697A \
  --color=hl+:#52697A \
  --color=border:#3D4F5C \
  --color=info:#75BDF0 \
  --color=marker:#A875F0 \
  --color=pointer:#FF007C \
  --color=prompt:#FF007C \
  --color=spinner:#FF007C \
  --color=header:#7580F0"

FZF_ALT_C_COMMAND="fd --type d --exclude .git --follow --hidden"
FZF_DEFAULT_COMMAND="fd --type f --exclude .git --follow --hidden"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

fzf_compgen_path() {
  fd --exclude ".git" --follow --hidden . "$1"
}

fzf_compgen_dir() {
  fd --exclude ".git" --follow --hidden --type d . "$1"
}

fkill() {
  ps aux | fzf --prompt="Select process to kill: " | awk '{print $2}' | xargs -r kill
}

# Search hidden files while respecting .gitignore
fvim() {
  fd --type f --strip-cwd-prefix | fzf | xargs nvim
}
