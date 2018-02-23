FROM alpine:3.7

MAINTAINER robbie.petit@gmail.com

RUN apk --update upgrade && \
    apk add --update python3 && \
    apk add --no-cache --virtual=temporary curl && \    
    curl "https://bootstrap.pypa.io/get-pip.py" | python3 && \
    apk del temporary && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/bin/python3 /usr/bin/python
    
RUN pip install scholarly==0.2.3

COPY scholar-search.py /usr/local/bin/scholar-search
RUN chmod 755 /usr/local/bin/scholar-search

WORKDIR /data
