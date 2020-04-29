FROM varnish:6.4 as build
WORKDIR /root/
RUN apt-get update && apt-get install --yes gcc make automake autoconf  varnish-dev wget

RUN wget https://github.com/varnish/varnish-modules/releases/download/varnish-modules-0.16.0/varnish-modules-0.16.0.tar.gz

RUN tar xfz varnish-modules-0.16.0.tar.gz
RUN cd varnish-modules-0.16.0 && ./configure && make && make install




FROM varnish:6.4
COPY --from=build /usr/lib/varnish/vmods/* /usr/lib/varnish/vmods/
