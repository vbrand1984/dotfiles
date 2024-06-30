# chezmoi:template: left-delimiter=@'{# right-delimiter=#}'@
@'{# if false -#}'@
# vim: ft=sh
@'{#- end -#}'@

ensure_sudo_is_working() {
    local sudo_working=1
    while [ $sudo_working -ne 0 ] ; do
        @'{# .apps.suApp #}'@ true
        sudo_working=$?
    done
}
