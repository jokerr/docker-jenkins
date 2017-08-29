# docker-jenkins

## Build and Setup
Build the image, `docker-compose build`.  If this is your first time this may take a little while.

Run the image, `docker-compose up -d` and open up `http://localhost:8080` on the browser of your choice.  You'll need the initial password to install Jenkins, grab it `docker exec -ti jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword`.

Install the standard plugins and continue as admin.