# gae-environment-deployer

Convenient shell script that can be used to deploy the same code to different
Google App Engine environments.

 
The command-line tools "dev_appserver.py" and "appcfg.py" are expected to be
available. Both are part of the [Google App Engine SDK for Python][1].


The script demonstrates the usage of the following three environments:
 
 * local environment
 
 	Available at [http://localhost:8080][2]

 * staging environment
 
 	Available at [http://YOUR_STAGING_ENV_APP_ID.appspot.com][3]

 * live environment
 
 	Available at [http://YOUR_LIVE_ENV_APP_ID.appspot.com][4]


If you habe a similar setup, just set your APP_IDs for <code>APP_ID_LIVE_ENV</code> and <code>APP_ID_STAGING_ENV</code>.


If you have more environments, just add them to the script.

## Usage:

Deploy to any of your environments by execuring <code>./deploy.sh *environment*</code>.

 [1]: https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_Python
 [2]: http://localhost:8080
 [3]: http://YOUR_STAGING_ENV_APP_ID.appspot.com
 [4]: http://YOUR_LIVE_ENV_APP_ID.appspot.com

 
[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/0552b16e28a112246e928a1f8b5f3cb9 "githalytics.com")](http://githalytics.com/SebastianEngel/gae-environment-deployer)
