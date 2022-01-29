ARG lang=german
ARG pandoc_version="2.10"
ARG eisvogel_version="2.0.0"

FROM pandoc/latex:${pandoc_version}


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
    ulem \
    unicode-math \
    upquote \
    xecjk \
    xurl \
    zref

#RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet \
#    && tlmgr install adjustbox \
#    babel-${lang} \
#    background \
#    collectbox \
#    everypage \
#    footmisc \
#    footnotebackref \
#    fvextra \
#    ly1 \
#    mdframed \
 #   mweights \
 #   needspace \
 #   pagecolor \
 #   sourcecodepro \
 #   sourcesanspro \
 #   titling \
 #   zref \
 #   haranoaji \
 #   ipaex

RUN mkdir -p /root/.pandoc/templates \
    && wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v${eisvogel_version}/eisvogel.tex \
    -O /root/.pandoc/templates/eisvogel.latex

RUN mkdir -p /root/.pandoc/defaults
COPY default.yaml /root/.pandoc/defaults/default.yaml

ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
