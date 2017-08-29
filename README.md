# docker-jenkins

## Build and Setup
Build the image, `docker-compose build`.  If this is your first time this may take a little while.

Run the image, `docker-compose up -d` and open up `http://localhost:8080` on the browser of your choice.  You'll need the initial password to install Jenkins, grab it `docker exec -ti jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword`.

Install the standard plugins and continue as admin.  

Note the restart may hang, if it does just stop the container and restart.  It may ask you to install again, just repeat the same steps and you'll be logged in.

## Configure sample GitHub project
Obviously this section assumes that you have a GitHub account.  If you don't go create on and come back here...

### Security
The GitHub plugin used in multibranch needs a credential with access to read from.  We can do this in GitHub by creating a new Personal Access token (PAT)
1. Go to https://github.com/settings/tokens
1. Click `Generate new token`
1. Give the token a name, example _SATJUG Jenkins_
1. Give the token full access to `repo` and `admin:repo_hook`
1. Click on Generate token
1. Copy the key or keep this window open for the next step.  This key will disapear and never be seen again....


Now we need to create a new credential in Jenkins for the Multibranch to use
1. In Jenkins go to _Jennkins > Credentials_
1. Select the store and domain that where you want to store the credential, I used *Jenkins/global*
1. Click *Add Credential*
1. Choose *Username with password*
1. Username is your username (the owner of the PAT)
1. Password is the PAT key generated from the previous step
1. Set the ID and description, I used the name of the PAT I created earlier.  Example: `satjug_jenkins_pat`


### Multibranch Job
1. In Jenkins go to _Jenkins > New Item_
1. Enter name, select Multibranch and click on `OK`
1. Configure the *Branch Sources*
1. Select GitHub and then select the PAT credential we created earlier
1. Set the Owner to the owner, your username
1. Set the Repository to the repo you want to monitor
1. Change the *Scan Multibranch Pipeline Trigger* by setting the *Periodically if not otherwise run* setting to an appropriate value
1. Save