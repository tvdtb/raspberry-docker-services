FROM ubuntu:19.10

EXPOSE 8200

RUN adduser -q --no-create-home --uid 1000 --disabled-password --disabled-login minidlna                          && \
    mkdir /var/minidlna/                                                                                          && \ 
    chown -R minidlna:minidlna /var/minidlna                                                                      && \
    echo created user minidlna 

RUN apt update                                                  && \
    apt install -y minidlna                                     && \
    apt clean                                                   && \
    echo minidlna installed

VOLUME /var/minidlna
VOLUME /var/cache/minidlna
VOLUME /var/log

COPY entrypoint.sh /
CMD sh /entrypoint.sh          
