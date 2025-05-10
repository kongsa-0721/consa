# VSCODE 的vim设置 设置 [1,2,4]
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default

# sublime settings
```
{
	"auto_complete": true,
	"auto_match_enabled": true,
	"color_scheme": "auto",
	"font_size": 20,
	"ignored_packages": [],
	"tab_size": 2,
	"theme": "Adaptive.sublime-theme",
	"dark_color_scheme": "Monokai.sublime-color-scheme",
	"light_color_scheme": "Sixteen.sublime-color-scheme",
	"hot_exit": true,
	"remember_open_files": true,
	"index_files": true,
}

```
