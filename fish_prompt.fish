# Git prompt
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showdirtystate 'yes'

# Git color
set __fish_git_prompt_color_dirtystate green
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_branch cyan
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Git Characters
set __fish_git_prompt_char_stagedstate "●"
set __fish_git_prompt_char_dirtystate "+"
set __fish_git_prompt_char_untrackedfiles "…"
set __fish_git_prompt_char_conflictedstate "*"
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_diverged '↑↓'
set __fish_git_prompt_char_cleanstate "✔"

function fish_prompt
  set -l last_status $status

  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l normal (set_color normal)

  set -l cwd $blue(pwd | sed "s:^$HOME:~:")

  # Output the prompt, left to right

  # Add a newline before new prompts
  echo -e ''

  # Print pwd or full path
  echo -n -s $cwd $normal
  __fish_git_prompt " %s"

  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  # Terminate with a nice prompt char
  echo -e ''
  echo -e -n -s $prompt_color 'λ ' $normal
end
