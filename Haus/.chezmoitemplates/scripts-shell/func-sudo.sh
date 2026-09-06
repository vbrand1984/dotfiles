# chezmoi:template: left-delimiter={@' right-delimiter='@}
{@' if false -'@}
# vim: ft=sh
#
# This template is used in scripts from the .chezmoiscripts directory.
# It adds a function which makes user to enter sudo password until he succeeds
#
# chezmoi variable to store relative path to this template: .tmpl.sh.funcSudo
#
{@'- end -'@}

# Include the ``vbd_Sudo'' function
. {@' joinPath .chezmoi.homeDir .dir.include "func-sudo.sh" '@}

{@'- /* This deletes an empty line after the template */ -'@}
