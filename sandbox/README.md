# Nette Sandbox in Docker

## Build

You can build this image locally, using:

```
docker build -t planette/nette-sandbox .
```

## Usage

```
docker run -it --rm -p 8000:80 planette/nette-sandbox
```

Now you can open `http://localhost:8000` in your browser.

## Demo

![](https://raw.githubusercontent.com/planette/dockerfiles/master/.docs/sandbox.png "Nette Sandbox")
