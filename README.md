# Docker image to run PHP CS FIXER in your workspace

**Official Github repository**
[https://github.com/FriendsOfPHP/PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)

**Documentation**
[http://cs.sensiolabs.org/](http://cs.sensiolabs.org/)

Minimal install and php-cs-fixer execution
-----------------------

```
docker run ypereirareis/php-cs-fixer
```

By default this run will execute `php-cs-fixer --help`

* **php-cs-fixer** from the ENTRYPOINT [Dockerfile](./Dockerfile) config
* **--help** from the CMD [Dockerfile](./Dockerfile) config


Add an alias into your ~/.bashrc OR ~/.zshrc OR ...
---------------------------

Open your matching file and paste this code:

```
php-cs-fixer () {
  docker run -it --rm --net host -v `pwd`:/app  ypereirareis/php-cs-fixer fix --level=psr2 --verbose $@
}
```

Of course you can modify the function name or php-cs-fixer options


Fig OR docker compose
---------------------------

Feel free to add the correct config into your fig.yml OR docker-compose.yml to run php-cs-fixer whenever you want.
