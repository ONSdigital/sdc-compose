#!/bin/sh

# Copy this file to the directory containing your service directories and run like this (changing the list of services
# as appropriate):
# ./runservices.sh sdc-login-user sdc-notify sdc-organisations sdc-questionnaire-responses

for service in "$@"; do
    if uname | grep -q Linux; then
        . "$WORKON_HOME/$service/bin/activate"
        gnome-terminal -t $service -x /bin/sh -c "cd $service; python app.py"
    else
        osascript -e 'tell application "Terminal" to do script ". '$WORKON_HOME/$service/bin/activate'; cd '$PWD/$service'; python app.py"'
    fi
done
