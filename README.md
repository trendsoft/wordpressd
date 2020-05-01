# WordPress

> WordPress运行环境

## 使用

### Pull

```bash
$ sudo docker pull trendsoft/wordpressd
```

### Run

```bash
$ docker run --name wordpress -dp 80:80 -v `pwd`:/var/www/html trendsoft/wordpressd
```

## Xdebug 使用

```bash
pecl install xdebug-2.5.0 && docker-php-ext-enable xdebug
```
