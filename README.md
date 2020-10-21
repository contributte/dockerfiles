# Nette in Docker

<img align="right" src="https://github.com/dockette.png">

Why is it useful to have Nette in container?

- process isolation
- multiplatform (linux, mac, windows)
- configurable via ENV
- plug & play

In case of you're looking for a fullstack Docker solution to Nette Framework. Take a look at [Dockette](https://github.com/dockette/).

There are many docker images that could help you:

- [dockette/web](https://github.com/dockette/web)
- [dockette/php](https://github.com/dockette/php)
- [dockette/ci](https://github.com/dockette/ci)
- [dockette/devstack](https://github.com/dockette/devstack)
- [dockette/nodejs](https://github.com/dockette/nodejs)

## Get Started

This is example of nette/sandbox in Docker. Docker image is based on **Debian Buster**, 
there is [PHP 7.4 FPM](https://deb.sury.org/), [Composer](https://getcomposer.org/), [Caddy server](https://caddyserver.com/).

### Build

You can build this image locally, using:

```
make build
```

```
docker build -t planette/nette ./sandbox
```

### Usage

```
make dev
```

```
docker run -it --rm -p 8000:80 planette/nette
```

Now you can open `http://localhost:8000` in your browser.

### Demo

![](https://raw.githubusercontent.com/planette/dockerfiles/master/.docs/sandbox.png "Nette Sandbox")
