
add_ssh_keys() {
    eval "$(ssh-agent -s)"

    for file in $HOME/.ssh/*.pub; do
        id_file=${file%.pub*}
        ssh-add $id_file
    done

}

alias add-ssh-keys=add_ssh_keys
