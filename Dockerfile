FROM sharelatex/sharelatex
MAINTAINER Stefan Thoeni <stefan@savvy.ch>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y texlive-full texlive-xetex

RUN cd /usr/share/texmf/tex/latex && git clone https://github.com/ppschweiz/PPS-Latex-Style && texhash
RUN cd /usr/share/texmf/tex/latex && git clone https://github.com/Bundesschiedsgericht/bsg2tex && texhash
RUN cd /usr/share/texmf/tex/latex && git clone https://github.com/throwException/pger-templates && texhash
COPY update-template /update-template
RUN chmod u+x /update-template

RUN cd /usr/share/fonts/truetype/ && mkdir aller && cd aller && wget https://www.fontsquirrel.com/fonts/download/Aller && mv Aller aller.zip && unzip aller.zip && fc-cache -f -v

COPY settings.coffee /etc/sharelatex/settings.coffee
