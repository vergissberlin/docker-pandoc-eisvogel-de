# docker-pandoc-eisvogel-ja

![Build](https://github.com/vergissberlin/docker-pandoc-eisvogel-de/workflows/Build/badge.svg)

Pandoc docker image with [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template for German.

## Usage

### Basic Usage

```console
$ docker run --rm -v $(pwd):/data vergissberlin/pandoc-eisvogel-de \
    -o doc.pdf \
    doc.md
```

### PlantUML

The `plantuml` tag supports [PlantUML](https://plantuml.com/) using [timofurrer/pandoc-plantuml-filter](timofurrer/pandoc-plantuml-filter).

```console
$ docker run --rm -v $(pwd):/data frozenbonito/pandoc-eisvogel-de:plantuml \
    -o doc.pdf \
    doc.md
```

## Examples

See [examples](./examples) directory.
