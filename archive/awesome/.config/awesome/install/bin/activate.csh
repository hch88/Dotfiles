which deactivate-lua >&/dev/null && deactivate-lua

alias deactivate-lua 'if ( -x '\''/home/harish/Dotfiles/awesome/.config/awesome/install/bin/lua'\'' ) then; setenv PATH `'\''/home/harish/Dotfiles/awesome/.config/awesome/install/bin/lua'\'' '\''/home/harish/Dotfiles/awesome/.config/awesome/install/bin/get_deactivated_path.lua'\''`; rehash; endif; unalias deactivate-lua'

setenv PATH '/home/harish/Dotfiles/awesome/.config/awesome/install/bin':"$PATH"
rehash
