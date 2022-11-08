ARG pandoc_version="latest-alpine"
ARG lang="german"
ARG la="de"
ARG eisvogel_version="2.0.0"

FROM pandoc/core:${pandoc_version}

LABEL maintainer="André Lademann <vergissbrerlin@gmail.com>" \
	        description="pandoc in Docker with Eisvogel template"

RUN apk add \
    bash \
    curl  \
    dia \
    fontconfig \
    git \
    librsvg \
    openssh-client \
    py3-pip \
    rsync \
    texlive \
    texlive-luatex \
    texlive-xetex \
    ttf-liberation 

ENV TEXMF=.:/opt/tex/cur//:

RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet
#RUN wget --no-verbose https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
#RUN sh update-tlmgr-latest.sh -- --upgrade
RUN tlmgr update --self
RUN tlmgr install \
        adjustbox \
        babel-${lang} \
        bib-${la} \
        background \
        bidi \
        collectbox \
        csquotes \
        everypage \
        filehook \
        float \
        footmisc \
        footnotebackref \
        framed \
        fvextra \
        koma-script \
        letltxmacro \
        ly1 \
        mdframed \
        mweights \
        needspace \
        pagecolor \
        titling \
        ucharcat \
        ulem \
        unicode-math \
        upquote \
        sourcecodepro \
        sourcesanspro \
        xecjk \
        xurl \
        zref

RUN mkdir -p /root/.pandoc/templates \
    && wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v${eisvogel_version}/eisvogel.tex \
    -O /root/.pandoc/templates/eisvogel.latex

RUN mkdir -p /root/.pandoc/defaults
COPY default.yaml /root/.pandoc/defaults/default.yaml

ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
