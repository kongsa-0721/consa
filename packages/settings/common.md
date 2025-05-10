# VSCODE 的vim设置 设置 [1,2,4]

## 检查各应用的独立设置    
defaults read -g ApplePressAndHoldEnabled 2>/dev/null || echo "全局未设置，使用系统默认"

for app in com.microsoft.VSCode com.microsoft.VSCodeInsiders com.vscodium com.microsoft.VSCodeExploration; do
    defaults read $app ApplePressAndHoldEnabled 2>/dev/null && echo "$app 已设置" || echo "$app 未设置"
done

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default

# 全局的键盘设置
```
# 禁用长按字符选择（强制启用按键重复）
defaults write -g ApplePressAndHoldEnabled -bool false

# 同时调快按键重复速度（可选）
defaults write -g InitialKeyRepeat -int 15  # 初始延迟（毫秒，建议15）
defaults write -g KeyRepeat -int 2          # 重复速度（毫秒，建议1-2）
```

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
