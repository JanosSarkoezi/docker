FROM alpine
RUN apk add --update --no-cache \
    git \
    curl \
    vim \
    make \
    gcc \
    libc-dev \
    texlive \
    texmf-dist-latexextra \
    texmf-dist-games
# ENV PATH="/usr/share/texmf-dist/scripts/texlive:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:${PATH}"
ARG UID=999
ARG GID=999
RUN addgroup -g ${GID} saj && \
    adduser -D -u ${UID} -G saj -s /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git

WORKDIR /tmp
RUN curl -LO http://mirrors.ctan.org/fonts/chess/enpassant.zip
RUN unzip enpassant.zip
RUN mkdir -p /usr/share/texmf-dist/fonts/tfm/enpassant && cp enpassant/*.tfm /usr/share/texmf-dist/fonts/tfm/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/fonts/type1/enpassant && cp enpassant/*.pfb /usr/share/texmf-dist/fonts/type1/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/fonts/afm/enpassant && cp enpassant/*.afm /usr/share/texmf-dist/fonts/afm/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/fonts/enc/enpassant && cp enpassant/*.enc /usr/share/texmf-dist/fonts/enc/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/tex/latex/chessfss/enpassant && cp enpassant/*.fd /usr/share/texmf-dist/tex/latex/chessfss/enpassant/ && \
    cp enpassant/chess-enpassant.map /usr/share/texmf-dist/fonts/map/pdftex/updmap
ENV TERM="xterm"
ENV PERL5LIB="/usr/share/texmf-dist/scripts/texlive"

COPY ttf2pt1-3.4.4.tgz /tmp
RUN tar xzf ttf2pt1-3.4.4.tgz && cd ttf2pt1-3.4.4 && make install
COPY merid_tt.zip /tmp
RUN unzip merid_tt.zip -d /tmp
WORKDIR /usr/share/texmf-dist/fonts/type1/enpassant
RUN cp /tmp/MERIFONT.TTF . && ttf2pt1 -b MERIFONT.TTF chess-merida-board-fig-raw && mv chess-merida-board-fig-raw.afm ../../afm/enpassant

RUN mktexlsr
RUN sed -i '/Map Acorn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Alegreya.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map AnnSton.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map AnonymousPro.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ArrowsADF.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ArtNouv.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ArtNouvc.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map BaskervilleF.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map BulletsADF.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Carrickc.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Chivo.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ClearSans.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Cochineal.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Coelacanth.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ComicNeue.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ComicNeueAngular.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map CormorantGaramond.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map CountriesOfEurope.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map EBGaramond-Maths.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map EBGaramond.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ESSTIX.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Eichenla.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Eileen.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map EileenBl.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Elzevier.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map GotIn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map GoudyIn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Heuristica.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Kinigcap.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Konanur.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Kramer.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map LibreBaskerville.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map LibreBodoni.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map LibreCaslon.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map LobsterTwo.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map MnSymbol.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map MorrisIn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Nouveaud.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map OldStandard.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map OrnementsADF.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map PlayfairDisplay.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Raleway.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Romantik.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Rosario.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Rothdn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map RoyalIn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Sanremo.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map SourceCodePro.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map SourceSansPro.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map SourceSerifPro.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Starburst.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map TXUprCal.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Typocaps.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map XCharter.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map Zallman.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map accanthis.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map algolrevived.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map allrunes.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map antt.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ap.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map arabi.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map arabtex.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map archaicprw.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map arev.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map arevvn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map arimo.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ascii.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map aspectratio.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map augie.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map auncial.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map aurical.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map baskervaldx.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map bbold.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map belleek.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map bera.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map beuron.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map bguq.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map bkaiu.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map boondox.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map bsmiu.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map burmese.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cabin.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map caladea.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map calligra.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cantarell.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map carlito.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cbgreek-full.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ccicons.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map chartervn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map chemarrow.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cinzel.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cjhebrew.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map clm.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cm-lgc.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cmbrightvn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cmcyr.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cmexb.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cmin.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cmll.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cmsrb.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map comfortaa.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map concretevn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map crimson.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cyklop.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dad.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dante.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dejavu-type1.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dgj.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dictsym.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dmj.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map droid.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dstroke.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dutchcal.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map dvng.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map epigrafica.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map erewhon.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map esrelation.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map esvect.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ethiop.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fbb.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fdsymbol.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fetamont.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fge.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fira.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map foekfont.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fonetika.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fontawesome.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fourier-utopia-expert.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map fourier.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map frcursive.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gbsnu.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gentium-type1.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfsartemisia.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfsbaskerville.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfsbodoni.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfscomplutum.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfsdidot.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfsneohellenic.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfsporson.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gfssolomos.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gillius.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gkaiu.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map go.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map gptimes.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map grotesqvn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map hacm.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map hfbright.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map iby.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map icelandic.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map imfellEnglish.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ipaex-type1.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map iwona.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map kerkis.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map knitfont.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map kpfonts.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map kurier.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map lato.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map libertine.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map libertinegc.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map libertinust1math.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map linearA.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map lxfonts.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mathabx.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mc2j.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mcj.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdbch.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdgreek.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdici.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdpgd.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdpus.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdput.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdsymbol.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mdugm.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map merriweather.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map miama.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mintspirit.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mongolian.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map montserrat.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map morisawa.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mr2j.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mrj.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map musix.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map mxedruli.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map nanumfonts.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map nectec.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map newpx.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map newtx.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map newtxsf.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map newtxtt.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map nf.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map niceframe.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map nimbus15.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map noto.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map oasy.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ocrb.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map omega.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map opensans.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map overlock.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map paratype-type1.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map pbsi.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map phaistos.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map pigpen.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map plex.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map prodint.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map pxtx.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map quattrocento.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map recycle.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map roboto.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map rsfso.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map sansmathaccent.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map sansmathfonts.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map semaf.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map sipa.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map skt.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map sqrcaps.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map starfont.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map stix.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map stmaryrd.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map superiors.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map svrsymbols.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map syriac.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map tempora.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map tfrupee.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map tinos.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map tlwg.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map trajan.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map txttvn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map uaq.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ugq.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map umj.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map universalis.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map urwvn.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map vnrother.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map vnrtext.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map vntopia.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map xypic.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ybd.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map ybv.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yes.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yfrak.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yhmath.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yly.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yrd.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yv1.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yv2.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yv3.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yvo.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map yvt.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map zi4.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map cherokee.map/d' /usr/share/texmf-dist/web2c/updmap.cfg && \
    sed -i '/Map oinuit.map/d' /usr/share/texmf-dist/web2c/updmap.cfg
RUN updmap -sys --enable Map=chess-enpassant.map
RUN rm -fr /tmp/*

USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/tmux/tmux/git/refs/heads/master version.json
ADD https://api.github.com/repos/JanosSarkoezi/latex/git/refs/heads/master version.json
RUN git clone https://github.com/JanosSarkoezi/latex.git
WORKDIR /home/saj/git/latex
RUN git checkout chess
