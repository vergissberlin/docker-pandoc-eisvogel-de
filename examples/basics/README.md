# Basics

## Build

```console
$ docker run --rm -v $(pwd):/data vergissberlin/pandoc-eisvogel-de \
    -d config.yaml \
    -o doc.pdf \
    doc.md
```
