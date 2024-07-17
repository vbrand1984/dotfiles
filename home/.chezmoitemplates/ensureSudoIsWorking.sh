# chezmoi:template: left-delimiter=@'{% right-delimiter=%}'@
ensure_sudo_is_working() {
    sudo_working=1
    while [ $sudo_working -ne 0 ] ; do
        @'{% .cmdSu %}'@ true
        sudo_working=$?
    done
}
