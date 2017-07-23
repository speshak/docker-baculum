# Docker-baculum

Deploy [Baculum Web GUI Tool](http://www.bacula.org/7.4.x-manuals/en/console/Baculum_Web_GUI_Tool.html) on Apache 2.4, PHP 5.6.

# Supported tags and respective `Dockerfile` links

- [`3.2`, `3.2-php5.6-apache`, `latest` (*php5.6/apache/3.2/Dockerfile*)](https://bitbucket.org/eltercera/docker-processmaker/src/50849e0f18306ad18cb397848431edf834bc1503/php5.6/apache/3.2/Dockerfile?at=master&fileviewer=file-view-default)


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
    -v ../bacula/bconsole.conf:/etc/bacula/bconsole.conf
    eltercera/docker-baculum
```

### Configuration

* Go to  http://hostip:9095/
