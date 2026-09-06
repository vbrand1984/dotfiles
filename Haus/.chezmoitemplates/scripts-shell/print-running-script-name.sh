# chezmoi:template: left-delimiter={@' right-delimiter='@}
{@' if false -'@}
# vim: ft=sh
#
# This template is used in scripts from the .chezmoiscripts directory.
# It prints the name of the running script in color.
#
# NB: it also includes the ``func-print-message.sh'' file
# with the definitions for the ``vbd_Print_Message*'' functions
# so that you don't need to do that explicitly once you included this template
#
# chezmoi variable to store relative path to this template: .tmpl.msg.printRunningScriptName
#
{@'- end -'@}

{@'/* Include the ``vbd_Print_Message*'' functions */ -'@}
{@' includeTemplate .tmpl.sh.funcPrintMessage . '@}

vbd_Print_Header "Running {@' base .chezmoi.sourceFile '@}..."

{@'- /* This deletes an empty line after the template */ -'@}
