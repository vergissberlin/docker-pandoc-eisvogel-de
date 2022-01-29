ARG pandoc_version="2.17-alpine"

FROM pandoc/latex:${pandoc_version}

ARG lang="german"
ARG eisvogel_version="2.0.0"

#ARG CTAN_REPO="http://mirror.las.iastate.edu/tex-archive/systems/texlive/tlnet"
#ENV CTAN_REPO=$CTAN_REPO
#RUN curl -sL "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh

RUN tlmgr option repository https://ctan.space-pro.be/tex-archive/systems/texlive/tlnet/ &&\
    tlmgr install \
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
        koma-script \
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
        ulem \
        unicode-math \
        upquote \
        xecjk \
        xurl \
        zref

RUN mkdir -p /root/.pandoc/templates \
    && wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v${eisvogel_version}/eisvogel.tex \
    -O /root/.pandoc/templates/eisvogel.latex

RUN mkdir -p /root/.pandoc/defaults
COPY default.yaml /root/.pandoc/defaults/default.yaml

ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
