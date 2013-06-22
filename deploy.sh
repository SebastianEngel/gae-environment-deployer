#!/bin/sh

################################################################################
# Convenient shell script that can be used to deploy the same code to different
# Google App Engine environments.
# 
# The command-line tools "dev_appserver.py" and "appcfg.py" are expected to be
# available. Both are part of the Google App Engine SDK for Python. You can
# download the SDK at:
# https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_Python
#
#
# The script demonstrates the usage of the following three environments:
# 
# * local environment
# 
# 	Available at http://localhost:8080
#
# * staging environment
# 
# 	Available at http://YOUR_STAGING_ENV_APP_ID.appspot.com
#
# * live environment
# 
# 	Available at http://YOUR_LIVE_ENV_APP_ID.appspot.com
#
#
# If you habe a similar setup, just set your APP_IDs for APP_ID_LIVE_ENV
# and APP_ID_STAGING_ENV.
#
# If you have more environments, just add them to the script.
#
# 
# Usage:
# ======
# Deploy to any of your environments by execuring ./deploy.sh *environment*.
#
#
################################################################################

# Declaration of APP_IDs for staging and live environments
APP_ID_LIVE_ENV="<YOUR_LIVE_ENV_APP_ID>"
APP_ID_STAGING_ENV="<YOUR_STAGING_ENV_APP_ID"

function show_usage() {
  echo "Usage: $0 environment"
  echo
  echo "     where environment can be:"
  echo
  echo "     local       - Deploys to the local environment"
  echo "     staging     - Deploys to the staging environment"
  echo "     live        - Deploys to the live environment"
  echo
}

if [ $# -ne 1 ] ; then
  show_usage
  exit 0
fi

if [ "$1" = "local" ] ; then
	echo
	echo "Deploying to *LOCAL* environment ..."
	echo
	echo "Access at: http://localhost:8080"
	echo "Press CTRL+C to abort"
	echo

	dev_appserver.py .

elif [ "$1" = "staging" ] ; then
	echo "About to deploy the to *STAGING* environment. Continue? [n=No | y=Yes]"

	read -s -n 1
	while [ "$REPLY" != "y" -a "$REPLY" != "n" ] ; do
		read -s -n 1
	done

	if [ "$REPLY" = "y" ] ; then
		echo
		echo "Deploying to *STAGING* environment ..."
		echo

		appcfg.py --application=$APP_ID_STAGING_ENV --oauth2 update .

		echo
		echo "Deployment to *STAGING* environment finished."
	else
		echo "Aborting ..."
	fi

elif [ "$1" = "live" ] ; then
	echo "About to deploy to *LIVE* environment. Continue? [n=No | y=Yes]"
	
	read -s -n 1
	while [ "$REPLY" != "y" -a "$REPLY" != "n" ] ; do
		read -s -n 1
	done

	if [ "$REPLY" = "y" ] ; then
		echo
		echo "Deploying to *LIVE* environment ..."
		echo

		appcfg.py --application=$APP_ID_LIVE_ENV --oauth2 update .

		echo
		echo "Deployment to *LIVE* environment finished."
	else
		echo "Aborting ..."
	fi

else
	show_usage
	exit 0
fi
