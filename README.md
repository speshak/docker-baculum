# Docker-baculum

Deploy [Baculum Web GUI Tool](http://www.bacula.org/7.4.x-manuals/en/console/Baculum_Web_GUI_Tool.html) on Apache 2.4, PHP 5.6.

# Supported tags and respective `Dockerfile` links

- [`7.4`, `7.4.7`, `7.4.7-alpine`,`latest` (*7.4.7-alpine/Dockerfile*)](https://bitbucket.org/eltercera/docker-baculum/src/6466fac824caca42ed7c5659b6736faeb774a92f/7.4.7-alpine/Dockerfile?at=master&fileviewer=file-view-default)


## Start the Container

### Environment variables
All variables are optionals.

* *BACULUM_USER:* Initial user for Baculum auth. (Default: admin)
* *BACULUM_PASSWD:* Initial password for Baculum auth. (Default: admin)

### Run

```
docker run -d \
    --name baculum-test \
    -p 9095:9095 \
    -e "BACULUM_USER=some_user" \
    -e "BACULUM_PASSWD=some_passwd" \
    -v ../bacula/bconsole.conf:/etc/bacula/bconsole.conf \
    eltercera/docker-baculum
```

### Configuration

* Go to  http://hostip:9095/ and complete the wizard.
