## -----------------------------------------------------------------------------
## ZSH PLUGINS
##
## Loads Oh-My-Zsh plugins, Homebrew-installed plugins, and FZF integrations.
## -----------------------------------------------------------------------------

OMZ="$ZDOTDIR/plugins/ohmyzsh"

## -----------------------------------------------------------------------------
## OH-MY-ZSH PLUGINS
## -----------------------------------------------------------------------------
[[ -f "$OMZ/plugins/git/git.plugin.zsh" ]] && source "$OMZ/plugins/git/git.plugin.zsh"
[[ -f "$OMZ/plugins/sudo/sudo.plugin.zsh" ]] && source "$OMZ/plugins/sudo/sudo.plugin.zsh"
[[ -f "$OMZ/plugins/colored-man-pages/colored-man-pages.plugin.zsh" ]] && source "$OMZ/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
[[ -f "$OMZ/plugins/dirhistory/dirhistory.plugin.zsh" ]] && source "$OMZ/plugins/dirhistory/dirhistory.plugin.zsh"

## -----------------------------------------------------------------------------
## HOMEBREW PLUGINS
## -----------------------------------------------------------------------------

# autosuggestions
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# history substring search
[[ -f "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# alias reminder
[[ -f "$HOMEBREW_PREFIX/opt/you-should-use/share/you-should-use/you-should-use.plugin.zsh" ]] && source "$HOMEBREW_PREFIX/opt/you-should-use/share/you-should-use/you-should-use.plugin.zsh"

# fzf-tab completion
[[ -f "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.plugin.zsh" ]] && source "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.plugin.zsh"

## -----------------------------------------------------------------------------
## FZF (FUZZY FINDER)
## -----------------------------------------------------------------------------

if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
fi

if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

## -----------------------------------------------------------------------------
## SYNTAX HIGHLIGHTING (MUST BE LAST)
## -----------------------------------------------------------------------------
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
