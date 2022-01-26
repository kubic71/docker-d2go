alias r ranger
alias vi nvim
alias gitl "git log --all --graph --decorate --oneline"
alias python python3

# open new terminal in the same directory 
function saveloc --on-event fish_prompt
    pwd > /tmp/whereami
end

if status is-interactive
    cd (cat /tmp/whereami)
end

# load functions that are not autoloaded
for func_file in ( find ~/.config/fish/my_functions/ -type f | grep '\.fish' )
    source  $func_file
end

