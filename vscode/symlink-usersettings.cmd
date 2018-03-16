IF EXIST %APPDATA%\Code\User RENAME %APPDATA%\Code\User User.bak
MKLINK /J %APPDATA%\Code\User "%USERPROFILE%\Documents\dotfiles\vscode"
ECHO workspaceStorage>> %APPDATA%\Code\User\.gitignore