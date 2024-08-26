<p align="center">
    <br>
    <a href="https://wayof.dev" target="_blank">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/wayofdev/.github/master/assets/logo.gh-dark-mode-only.png">
            <img width="400" src="https://raw.githubusercontent.com/wayofdev/.github/master/assets/logo.gh-light-mode-only.png" alt="WayOfDev Logo">
        </picture>
    </a>
    <br>
</p>

<div align="center">
<a href="https://actions-badge.atrox.dev/wayofdev/docker-php-base/goto"><img alt="Build Status" src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fwayofdev%2Fdocker-php-base%2Fbadge&style=flat-square"/></a>
<a href="https://github.com/wayofdev/docker-php-base/tags"><img src="https://img.shields.io/github/v/tag/wayofdev/docker-php-base?sort=semver&style=flat-square" alt="Latest Version"></a>
<a href="https://hub.docker.com/repository/docker/wayofdev/php-base"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/wayofdev/php-base?style=flat-square"></a>
<a href="LICENSE.md"><img src="https://img.shields.io/github/license/wayofdev/docker-php-base.svg?style=flat-square&color=blue" alt="Software License"/></a>
<a href="#"><img alt="Commits since latest release" src="https://img.shields.io/github/commits-since/wayofdev/docker-php-base/latest?style=flat-square"></a>
</div>

<br>

# Docker Image: PHP Base

Repository contains dist folder with generated basic PHP images and source code, written on Ansible, to generate them. Is used together with other WOD images, to create local development environment for our projects.

Enabled extensions by default:

| Extension                                                    | Description                                                                      | Type   |
|--------------------------------------------------------------|----------------------------------------------------------------------------------|--------|
| [intl](https://www.php.net/manual/en/book.intl.php)          | Internationalization functions                                                   | native |
| [pcntl](https://www.php.net/manual/en/book.pcntl.php)        | Process control                                                                  | native |
| [sockets](https://www.php.net/manual/en/book.sockets.php)    | Socket communication functions                                                   | native |
| [pdo_pgsql](https://www.php.net/manual/en/ref.pdo-pgsql.php) | PostgreSQL functions                                                             | native |
| [pdo_mysql](https://www.php.net/manual/en/ref.pdo-mysql.php) | Mysql functions                                                                  | native |
| [opcache](https://www.php.net/manual/en/book.opcache.php)    | Improves PHP performance by storing precompiled script bytecode in shared memory | native |
| [zip](https://www.php.net/manual/en/book.zip.php)            | Read/write functions for ZIP archives                                            | native |
| [bcmath](https://www.php.net/manual/en/book.bc.php)          | For arbitrary precision mathematics                                              | native |
| [exif](https://www.php.net/manual/en/book.exif.php)          | Exchangeable image information                                                   | native |
| [gd](https://www.php.net/manual/en/book.image.php)           | Image processing and manipulation library                                        | native |
| [redis](https://pecl.php.net/package/redis)                  | Functions for interfacing with Redis                                             | pecl   |
| [memcached](https://pecl.php.net/package/memcached)          | Functions for interfacing with Memcached                                         | pecl   |
| [decimal](https://pecl.php.net/package/decimal)              | Arbitrary precision floating-point decimal                                       | pecl   |
| [amqp](https://pecl.php.net/package/amqp)                    | Advanced Message Queuing Protocol (AMQP) library                                 | pecl   |
| [yaml](https://pecl.php.net/package/yaml)                    | YAML library                                                                     | pecl   |
| [grpc](https://pecl.php.net/package/grpc)                    | gRPC library                                                                     | pecl   |
| [protobuf](https://pecl.php.net/package/protobuf)            | Protocol Buffers library                                                         | pecl   |

<br>

If you **like/use** this repository, please consider **starring** it. Thanks!

<br>

## 🔧 Configuration

Ansible is used to generate distribution files, to add or remove PHP extensions, or configure project, see [group_vars/base.yml](https://github.com/wayofdev/docker-php-base/blob/master/src/group_vars/base.yml)

**Default .ini settings for PHP:**

```yaml
settings_opcache_ini:
  php_opcache_enable: 1
  php_opcache_enable_cli: 1

settings_php_ini:
  php_timezone: "UTC"
  php_post_max_size: "16M"
  php_memory_limit: "256M"
```

**Default extension configuration:**

```yaml
ext_native_enabled:
  - intl
  - pcntl
  - sockets
  - pdo_mysql
  - pdo_pgsql
  - OPcache
  - zip
  - bcmath
  - exif
  - gd

ext_pecl_enabled:
  - redis
  - memcached
  - decimal
  - amqp
  - yaml
```

<br>

To generate dist files use ansible command:

```bash
make generate
```

<br>

## ⚙️ Development

To install dependencies and start development you can check contents of our `Makefile`

### →  Requirements

For testing purposes we use **goss** and **dgoss**, follow installation instructions on  [their official README](https://github.com/aelsabbahy/goss/blob/master/extras/dgoss/README.md)

<br>

### → Building locally

Generating distributable Dockerfiles from yaml source code:

```bash
make generate
```

<br>

Building default image:

```bash
git clone git@github.com:wayofdev/docker-php-base.git
make build
```

To **build** image, **test** it and then **clean** temporary files run:

```bash
make
```

Building all images:

```bash
make build IMAGE_TEMPLATE="8.1-cli-alpine"
make build IMAGE_TEMPLATE="8.1-fpm-alpine"
make build IMAGE_TEMPLATE="8.1-supervisord-alpine"
make build IMAGE_TEMPLATE="8.2-cli-alpine"
make build IMAGE_TEMPLATE="8.2-fpm-alpine"
make build IMAGE_TEMPLATE="8.2-supervisord-alpine"
make build IMAGE_TEMPLATE="8.3-cli-alpine"
make build IMAGE_TEMPLATE="8.3-fpm-alpine"
make build IMAGE_TEMPLATE="8.3-supervisord-alpine"
```

<br>

## 🧪 Testing

You can check `Makefile` to get full list of commands for local testing. For testing, you can use these commands to test whole role or separate tasks:

Testing default image:

```bash
make test
```

To test all images:

```bash
make test IMAGE_TEMPLATE="8.1-cli-alpine"
make test IMAGE_TEMPLATE="8.1-fpm-alpine"
make test IMAGE_TEMPLATE="8.1-supervisord-alpine"
make test IMAGE_TEMPLATE="8.2-cli-alpine"
make test IMAGE_TEMPLATE="8.2-fpm-alpine"
make test IMAGE_TEMPLATE="8.2-supervisord-alpine"
make test IMAGE_TEMPLATE="8.3-cli-alpine"
make test IMAGE_TEMPLATE="8.3-fpm-alpine"
make test IMAGE_TEMPLATE="8.3-supervisord-alpine"
```

<br>

### → Code quality tools

Run **yamllint** to validate all yaml files in project:

```bash
make lint-yaml
```

Run hadolint to validate created Dockerfiles:

```bash
make lint-docker
```

Run ansible-lint to validate ansible project files:

```bash
make lint-ansible
```

Run [dive](https://github.com/wagoodman/dive) command to analyze image:

```bash
make analyze
```

<br>

## 🤝 License

[![Licence](https://img.shields.io/github/license/wayofdev/docker-php-base?style=for-the-badge&color=blue)](./LICENSE)

<br>

## 🙆🏼‍♂️ Author Information

This repository was created in **2022** by [lotyp / wayofdev](https://github.com/wayofdev).

<br>

## 🫡 Contributors

<img align="left" src="https://img.shields.io/github/contributors-anon/wayofdev/docker-php-base?style=for-the-badge" alt="Contributors"/>

<br>
