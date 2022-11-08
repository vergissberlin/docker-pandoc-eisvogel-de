# docker-pandoc-eisvogel-de

![Build](https://github.com/vergissberlin/docker-pandoc-eisvogel-de/workflows/Build/badge.svg)

Pandoc docker image with [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template for German language.

## Usage

### Basic Usage

```shell
docker run --rm -v $(pwd):/data ghcr.io/vergissberlin/pandoc-eisvogel-de \
    -o doc.pdf \
    doc.md
```


## Examples

See [examples](./examples) directory.
