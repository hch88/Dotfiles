if functions -q deactivate-lua
    deactivate-lua
end

function deactivate-lua
    if test -x '/home/harish/Dotfiles/awesome/.config/awesome/install/bin/lua'
        eval ('/home/harish/Dotfiles/awesome/.config/awesome/install/bin/lua' '/home/harish/Dotfiles/awesome/.config/awesome/install/bin/get_deactivated_path.lua' --fish)
    end

    functions -e deactivate-lua
end

set -gx PATH '/home/harish/Dotfiles/awesome/.config/awesome/install/bin' $PATH
