# Nette Sandbox in Docker

## Protip

<img align="right" src="https://github.com/dockette.png">

In case of you're looking for an fullstack Docker solution to Nette Framework. Take a look at [Dockette](https://github.com/dockette/).

There are many docker images that could help you:

- [dockette/web](https://github.com/dockette/web)
- [dockette/php](https://github.com/dockette/php)
- [dockette/ci](https://github.com/dockette/ci)
- [dockette/devstack](https://github.com/dockette/devstack)


## Usage

You have to download and run our special docker image via following command.

```bash
docker run -it --rm -p 8000:80 fonette/sandbox
```

Now you can open `http://localhost:8000` in your browser.


![](https://raw.githubusercontent.com/FriendsOfNette/docker-sandbox/master/sandbox.png "Nette Sandbox")
