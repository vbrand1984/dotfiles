# chezmoi:template: left-delimiter={@' right-delimiter='@}
{@' if false -'@}
# vim: set ft=sh:
#
# This template is used in scripts from the .chezmoiscripts directory.
# It includes the ``func-print-message.sh'' file which holds
# several functions for printing coloured messages in the terminal
#
# chezmoi variable to store relative path to this template: .tmpl.sh.funcPrintMessage
#
{@'- end -'@}

# Include the ``vbd_Print_Message*'' functions
. {@' joinPath .chezmoi.homeDir .dir.include "func-print-message.sh" '@}

{@'- /* This deletes an empty line after the template */ -'@}
