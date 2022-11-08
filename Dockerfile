ARG pandoc_version="latest"

FROM pandoc/latex:${pandoc_version}

LABEL maintainer="André Lademann <vergissbrerlin@gmail.com>" \
	        description="Pandoc in Docker with Eisvogel template."


ARG lang="german"
ARG eisvogel_version="2.0.0"

# Install dependencies
RUN tlmgr install \
    adjustbox \
    babel-${lang} \
    background \
    bidi \
    collectbox \
    csquotes \
    everypage \
    filehook \
    footmisc \
    footnotebackref \
    framed \
    fvextra \
    letltxmacro \
    ly1 \
    mdframed \
    mweights \
    needspace \
    pagecolor \
    sourcecodepro \
    sourcesanspro \ 
    titling \
    ucharcat \
    ulem unicode-math \
    upquote \
    xecjk \
    xurl \
    zref \
    koma-script


# Eisvogel template
RUN mkdir -p /opt/pandoc/templates && \
    wget -O - https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v2.0.0/Eisvogel-${eisvogel_version}.tar.gz | \
    tar zxvf - -C /opt/pandoc/templates

# Packages
RUN apk add --no-cache \
    graphviz \
    openjdk11 \
    python3 \
    py3-pip \
    ttf-droid \
    ttf-droid-nonlatin

# Default settings
RUN mkdir -p /root/.pandoc/defaults
COPY default.yaml /root/.pandoc/defaults/default.yaml

ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
