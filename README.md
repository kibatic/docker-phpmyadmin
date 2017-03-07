DO NOT USE IN PRODUCTION ! IT'S DESIGNED AS A DEV TOOL.

# PhpMyAdmin with automatic container detection

if you have containers using the official `mysql` or `mariadb` image, they will be automatically available in the PhpMyAdmin server list.

```
docker run --name pma -d -p 8080:80 -e DOCKER_HOST=unix:///tmp/docker.sock -v /var/run/docker.sock:/tmp/docker.sock:ro kibatic/phpmyadmin
```
