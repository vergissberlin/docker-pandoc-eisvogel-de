ARG pandoc_version="latest"

FROM pandoc/latex:${pandoc_version}

LABEL maintainer="André Lademann <vergissbrerlin@gmail.com>" \
	        description="Pandoc in Docker with Eisvogel template."


ARG lang="german"

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
ARG eisvogel_version="2.0.0"
RUN mkdir -p /opt/pandoc/templates && \
    wget --no-verbose -O - https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v2.0.0/Eisvogel-2.0.0.tar.gz | \
    tar zxvf - -C /opt/pandoc/templates

# Packages
RUN apk add --no-cache \
    graphviz \
    openjdk11 \
    python3 \
    py3-pip \
    texlive-full \
    ttf-droid \
    ttf-droid-nonlatin

# PlantUML
ARG plantuml_version="1.2022.2"
RUN wget https://github.com/plantuml/plantuml/releases/download/v${plantuml_version}/plantuml-${plantuml_version}.jar -O /opt/plantuml.jar
RUN pip3 install --upgrade pip
RUN pip3 install pandoc-plantuml-filter
ENV PLANTUML_BIN="java -jar /opt/plantuml.jar"

# Default settings
RUN mkdir -p /root/.pandoc/defaults
COPY default.yaml /root/.pandoc/defaults/default.yaml

#ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
ENTRYPOINT [ "/usr/local/bin/pandoc" ]
