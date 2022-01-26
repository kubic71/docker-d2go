# Lists recursively all files and folders in a (by default current) directory, 
# pipes it to `fzf` and after choosing one destination it `cd`s into it
#
# Usage: c [path]

function c
        if test -z $argv
                # if no path is given, use current directory and exclude some directories
                set selected_path (fd -a -I -E "miniconda3/" -E "__pycache__" | fzf);
        else
                # if path is given, start the search from there
                set selected_path (fd -a -I . $argv | fzf);
        end

        # if selected_path is not empty, cd into it
        if test -n "$selected_path"
                if test -d "$selected_path"
                        # if selected_path is a directory, cd into it
                        cd $selected_path
                else
                        # if selected_path is a file, cd into its parent directory
                        cd (echo $selected_path | sed "s/\/[^\/]\+\$//")
                end
        end
end
