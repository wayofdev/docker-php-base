variable "NAMESPACE" {default = "wayofdev/php-base"}
variable "RELEASE_VERSION" {default = "2.9.0"}
variable "IS_RELEASE" {default = "0"}

target "default" {
    args = {
        IS_RELEASE = "${IS_RELEASE}",
        RELEASE_VERSION = "${RELEASE_VERSION}"
    }
    pull = true
    output = ["type=docker"]
}

function "tag" {
    params = [PHP_VERSION, PHP_VARIANT, PHP_OS]
    result = [
        equal("1",IS_RELEASE) ? "${NAMESPACE}:${PHP_VERSION}-${PHP_VARIANT}-${PHP_OS}-${RELEASE_VERSION}" : "",
        "${NAMESPACE}:${PHP_VERSION}-${PHP_VARIANT}-${PHP_OS}-latest",
    ]
}

###########################
##    PHP 8.1
###########################
target "php-81-cli-alpine" {
    inherits = ["default"]
    context = "dist/base/8.1-cli-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.1", "cli", "alpine")
}

target "php-81-fpm-alpine" {
    inherits = ["default"]
    context = "dist/base/8.1-fpm-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.1", "fpm", "alpine")
}

target "php-81-supervisord-alpine" {
    inherits = ["default"]
    context = "dist/base/8.1-supervisord-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.1", "supervisord", "alpine")
}

###########################
##    PHP 8.2
###########################
target "php-82-cli-alpine" {
    inherits = ["default"]
    context = "dist/base/8.2-cli-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.2", "cli", "alpine")
}

target "php-82-fpm-alpine" {
    inherits = ["default"]
    context = "dist/base/8.2-fpm-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.2", "fpm", "alpine")
}

target "php-82-supervisord-alpine" {
    inherits = ["default"]
    context = "dist/base/8.2-supervisord-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.2", "supervisord", "alpine")
}

###########################
##    PHP 8.3
###########################
target "php-83-cli-alpine" {
    inherits = ["default"]
    context = "dist/base/8.3-cli-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.3", "cli", "alpine")
}

target "php-83-fpm-alpine" {
    inherits = ["default"]
    context = "dist/base/8.3-fpm-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.3", "fpm", "alpine")
}

target "php-83-supervisord-alpine" {
    inherits = ["default"]
    context = "dist/base/8.3-supervisord-alpine"
    dockerfile = "./Dockerfile"
    tags = tag("8.3", "supervisord", "alpine")
}

group "all" {
    targets = [
#        "php-81-cli-alpine",
#        "php-81-fpm-alpine",
#        "php-81-supervisord-alpine",
#        "php-82-cli-alpine",
#        "php-82-fpm-alpine",
#        "php-82-supervisord-alpine",
#        "php-83-cli-alpine",
#        "php-83-fpm-alpine",
        "php-83-supervisord-alpine",
    ]
}

group "php-81" {
    targets = [
        "php-81-cli-alpine",
        "php-81-fpm-alpine",
        "php-81-supervisord-alpine",
    ]
}

group "php-82" {
    targets = [
        "php-82-cli-alpine",
        "php-82-fpm-alpine",
        "php-82-supervisord-alpine",
    ]
}

group "php-83" {
    targets = [
        "php-83-cli-alpine",
        "php-83-fpm-alpine",
        "php-83-supervisord-alpine",
    ]
}
