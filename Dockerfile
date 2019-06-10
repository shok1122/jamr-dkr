FROM alpine:3.9

ENV WORKDIR /app

COPY assets /app/assets

WORKDIR $WORKDIR
RUN \
	echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
	echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
	echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
	apk update && \
	apk add \
		bash \
		coreutils \
		git \
		openjdk8 \
		perl \
		icu \
		&& \
	git clone https://github.com/shok1122/jamr.git

WORKDIR $WORKDIR/jamr
RUN \
	git checkout Semeval-2016 && \
	pwd && \
	./setup && \
	cp /app/assets/quote-norm.pl tools/cdec/corpus/support

