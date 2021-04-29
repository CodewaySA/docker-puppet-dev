FROM codewaysa/ruby:2.7.3_20210429

LABEL image-name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# redcarpet is needed to run "puppet strings" but is not explicitly depended upon
RUN apk add --no-cache git=2.30.2-r0 && \
    apk add --no-cache --virtual .build-dependencies gcc=10.2.1_pre1-r3 make=4.3-r0 musl-dev=1.2.2-r0 ruby-dev=2.7.3-r0 && \
    gem install puppet:6.21.1 puppet-lint:2.4.2 puppet-strings:2.6.0 r10k:3.9.0 redcarpet:3.5.1 && \
    apk del .build-dependencies && \
    rm -rf /root/.gem/specs /var/lib/gems/*/cache
