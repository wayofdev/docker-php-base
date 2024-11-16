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

<p align="center">
<a href="https://actions-badge.atrox.dev/wayofdev/docker-php-base/goto"><img alt="Build Status" src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fwayofdev%2Fdocker-php-base%2Fbadge&style=flat-square"/></a>
<a href="https://github.com/wayofdev/docker-php-base/tags"><img src="https://img.shields.io/github/v/tag/wayofdev/docker-php-base?sort=semver&style=flat-square" alt="Latest Version"></a>
<a href="https://hub.docker.com/repository/docker/wayofdev/php-base"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/wayofdev/php-base?style=flat-square"></a>
<a href="LICENSE.md"><img src="https://img.shields.io/github/license/wayofdev/docker-php-base.svg?style=flat-square&color=blue" alt="Software License"/></a>
<a href="#"><img alt="Commits since latest release" src="https://img.shields.io/github/commits-since/wayofdev/docker-php-base/latest?style=flat-square"></a>
</p>

<br>

# Docker Image: PHP Base

The `docker-php-base` project is a **system** for creating and maintaining **PHP Docker images**.

It uses **Ansible** to generate **Dockerfiles** for multiple PHP versions (7.4, 8.0, **8.1, 8.2, 8.3**) and types (**CLI, FPM, Supervisord**) on **Alpine Linux**.

The project automates the build process using **GitHub Actions**, creating multi-architecture images (**AMD64** and **ARM64**) that are tested with [goss](https://github.com/goss-org/goss).

Images come pre-configured with a wide array of PHP extensions and are designed to serve as a base for PHP applications in both **development** and **production** environments.

<br>

If you **like/use** this package, please consider ⭐️ **starring** it. Thanks!

<br>

## 🚀 Features

- **Multiple PHP Versions:** Supports PHP 7.4, 8.0, 8.1, 8.2, and 8.3.
- **Various PHP Types:** Includes CLI, FPM, and Supervisord configurations.
- **Alpine-based:** Lightweight images built on Alpine Linux.
- **Pre-configured Extensions:** Comes with a wide range of pre-installed PHP extensions.
- **Customizable Settings:** Easily adjustable PHP and OPcache settings.
- **Multi-architecture Support:** Built for both AMD64 and ARM64 architectures.
- **Automated Builds:** Utilizes GitHub Actions for continuous integration and delivery.
- **Comprehensive Testing:** Implements dgoss for thorough Docker image testing.
- **Ansible-based Generation:** Leverages Ansible for flexible and maintainable Dockerfile generation.
- **Security Focused:** Includes Docker Scout scans for vulnerability checks.

<br>

## 🛠 Technology Stack

- **Ansible:** For generating Dockerfiles and configurations.
- **Docker:** Base technology for containerization.
- **GitHub Actions:** CI/CD pipeline for automated building, testing, and publishing.
- **dgoss:** For Docker image testing.
- **Alpine Linux:** Base OS for the Docker images.
- **PHP:** Core language with multiple versions (7.4, 8.0, 8.1, 8.2, 8.3).

<br>

## 📦 Pre-installed PHP Extensions

The images come with a variety of pre-installed PHP extensions:

| Extension                                                    | Description                                                                      | Type   |
|--------------------------------------------------------------|----------------------------------------------------------------------------------|--------|
| [intl](https://www.php.net/manual/en/book.intl.php)          | Internationalization functions                                                   | native |
| [pcntl](https://www.php.net/manual/en/book.pcntl.php)        | Process control                                                                  | native |
| [sockets](https://www.php.net/manual/en/book.sockets.php)    | Socket communication functions                                                   | native |
| [pdo_pgsql](https://www.php.net/manual/en/ref.pdo-pgsql.php) | PostgreSQL functions                                                             | native |
| [pdo_mysql](https://www.php.net/manual/en/ref.pdo-mysql.php) | MySQL functions                                                                  | native |
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

## 🚀 Usage

The PHP base images are available on both Docker Hub and GitHub Container Registry (ghcr.io). You can pull the images using either of the following methods:

### → Docker Hub

```bash
docker pull wayofdev/php-base:8.3-fpm-alpine-latest
```

### → GitHub Container Registry

```bash
docker pull ghcr.io/wayofdev/docker-php-base:8.3-fpm-alpine-latest
```

Replace `8.3-fpm-alpine-latest` with your desired PHP version, type, and tag.

### → Available Image Variants

The images are available in various combinations of PHP versions, types, and architectures:

- **PHP Versions:** 8.1, 8.2, 8.3
- **Types:** cli, fpm, supervisord
- **Architectures:** amd64, arm64

#### Examples

```bash
# PHP 8.1 CLI
docker pull wayofdev/php-base:8.1-cli-alpine-latest

# PHP 8.2 FPM
docker pull wayofdev/php-base:8.2-fpm-alpine-latest

# PHP 8.3 with Supervisord
docker pull wayofdev/php-base:8.3-supervisord-alpine-latest
```

For a complete list of available tags, please refer to the [Docker Hub Tags](https://hub.docker.com/r/wayofdev/php-base/tags) or [GitHub Container Registry Packages](https://github.com/wayofdev/docker-php-base/pkgs/container/docker-php-base) page.

### → Using in Dockerfile

To use these images as a base for your own Dockerfile:

```dockerfile
# From Docker Hub
FROM wayofdev/php-base:8.3-fpm-alpine-latest

# Or from GitHub Container Registry
# FROM ghcr.io/wayofdev/docker-php-base:8.3-fpm-alpine-latest

# Your additional Dockerfile instructions here
# ...
```

<br>

## 🔨 Development

This project uses a set of tools for development and testing. The `Makefile` provides various commands to streamline the development process.

### → Requirements

- Docker
- Make
- Ansible
- goss and dgoss for testing

### → Setting Up the Development Environment

Clone the repository:

```bash
git clone git@github.com:wayofdev/docker-php-base.git && \
cd docker-php-base
```

### → Generating Dockerfiles

Ansible is used to generate Dockerfiles and configurations. To generate distributable Dockerfiles from Jinja template source code:

```bash
make generate
```

### → Building Images

- Build the default image:

  ```bash
  make build
  ```

  This command builds the image specified by the `IMAGE_TEMPLATE` variable in the Makefile. By default, it's set to `8.3-fpm-alpine`.

- Build a specific image:

  ```bash
  make build IMAGE_TEMPLATE="8.3-fpm-alpine"
  ```

  Replace `8.3-fpm-alpine` with your desired PHP version, type, and OS.

- Build all images:

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

  These commands will build all supported image variants.

<br>

## 🔧 Configuration

Ansible is used to generate distribution files. To add or remove PHP extensions, or configure the project, you can modify the [src/group_vars/base.yml](https://github.com/wayofdev/docker-php-base/blob/master/src/group_vars/base.yml) file.

### → Default .ini settings for PHP

You can adjust the following PHP and OPcache settings in the `group_vars/base.yml` file:

```yaml
settings_opcache_ini:
  php_opcache_enable: 1
  php_opcache_enable_cli: 1

settings_php_ini:
  php_timezone: "UTC"
  php_post_max_size: "16M"
  php_memory_limit: "256M"
```

### → PHP Extensions

You can enable or disable PHP extensions by modifying the following sections in the `group_vars/base.yml` file:

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
  - grpc
  - protobuf
```

To add a new extension, simply add it to the appropriate list. To remove an extension, delete it from the list.

After making changes to the `group_vars/base.yml` file, you need to regenerate the Dockerfiles:

```bash
make generate
```

This command will use Ansible to process the updated configuration and generate new Dockerfiles with your custom settings.

<br>

## 🧪 Testing

This project uses a testing approach to ensure the quality and functionality of the Docker images. The primary testing tool is [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss), which allows for testing Docker containers.

### → Running Tests

You can run tests using the following commands:

- Test the default image:

  ```bash
  make test
  ```

  This command tests the image specified by the `IMAGE_TEMPLATE` variable in the Makefile (default is `8.3-fpm-alpine`).

- Test a specific image:

  ```bash
  make test IMAGE_TEMPLATE="8.3-fpm-alpine"
  ```

  Replace `8.3-fpm-alpine` with your desired PHP version, type, and OS.

- Test all images:

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

### → Test Configuration

The test configurations are defined in `goss.yaml` files, which are generated for each image variant. These files specify the tests to be run, including:

- File existence and permissions
- Process checks
- Port availability
- Package installations
- Command outputs
- PHP extension availability

### → Test Process

When you run the `make test` command, the following steps occur:

1. The specified Docker image is built (if not already present).
2. dgoss runs the tests defined in the `goss.yaml` file against the Docker container.
3. The test results are displayed in the console.

<br>

## 🔒 Security Policy

This project has a [security policy](.github/SECURITY.md).

<br>

## 🙌 Want to Contribute?

Thank you for considering contributing to the wayofdev community! We are open to all kinds of contributions. If you want to:

- 🤔 [Suggest a feature](https://github.com/wayofdev/docker-php-base/issues/new?assignees=&labels=type%3A+enhancement&projects=&template=2-feature-request.yml&title=%5BFeature%5D%3A+)
- 🐛 [Report an issue](https://github.com/wayofdev/docker-php-base/issues/new?assignees=&labels=type%3A+documentation%2Ctype%3A+maintenance&projects=&template=1-bug-report.yml&title=%5BBug%5D%3A+)
- 📖 [Improve documentation](https://github.com/wayofdev/docker-php-base/issues/new?assignees=&labels=type%3A+documentation%2Ctype%3A+maintenance&projects=&template=4-docs-bug-report.yml&title=%5BDocs%5D%3A+)
- 👨‍💻 [Contribute to the code](./.github/CONTRIBUTING.md)

You are more than welcome. Before contributing, kindly check our [contribution guidelines](.github/CONTRIBUTING.md).

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg?style=for-the-badge)](https://conventionalcommits.org)

<br>

## 🫡 Contributors

<p align="left">
<a href="https://github.com/wayofdev/docker-php-base/graphs/contributors">
<img align="left" src="https://img.shields.io/github/contributors-anon/wayofdev/docker-php-base?style=for-the-badge" alt="Contributors Badge"/>
</a>
<br>
<br>
</p>

## 🌐 Social Links

- **Twitter:** Follow our organization [@wayofdev](https://twitter.com/intent/follow?screen_name=wayofdev) and the author [@wlotyp](https://twitter.com/intent/follow?screen_name=wlotyp).
- **Discord:** Join our community on [Discord](https://discord.gg/CE3TcCC5vr).

<br>

## ⚖️ License

[![Licence](https://img.shields.io/github/license/wayofdev/docker-php-base?style=for-the-badge&color=blue)](./LICENSE.md)

<br>
